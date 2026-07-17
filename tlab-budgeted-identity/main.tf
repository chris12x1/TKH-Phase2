provider "aws" {
  region = "us-east-1"
}

# ==============================================================================
# PHASE 1: THE BUDGET (Step 2)
# Hard limit of $10.00 USD monthly, alerting at 80% to your email
# ==============================================================================
resource "aws_budgets_budget" "tlab_budget" {
  name              = "TLAB-Strict-Budget"
  budget_type       = "COST"
  limit_amount      = "10.00" # Fixed to $10.00
  limit_unit        = "USD"
  time_unit         = "MONTHLY"

  notification {
    comparison_operator        = "GREATER_THAN"
    notification_type          = "ACTUAL"
    threshold                  = 80 # Fixed to 80%
    threshold_type             = "PERCENTAGE"
    subscriber_email_addresses = ["christopher.diaz87@yahoo.com"]
  }
}

# ==============================================================================
# PHASE 2: THE SECURE S3 BUCKET (Step 3)
# Creates a random ID and a private-by-default S3 storage bucket
# ==============================================================================
resource "random_id" "id" {
  byte_length = 4
}

resource "aws_s3_bucket" "vault" {
  # Dynamically named with your initials (Replace "IK" with yours if desired)
  bucket        = "titan-fintech-vault-cd-${random_id.id.hex}"
  force_destroy = true # Ensures clean destruction during 'terraform destroy'
}

resource "aws_s3_bucket_public_access_block" "vault_privacy" {
  bucket = aws_s3_bucket.vault.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# ==============================================================================
# PHASE 3: THE IAM ROLE & LEAST PRIVILEGE POLICY (Step 4)
# Allowed only to write objects directly to the S3 bucket created above
# ==============================================================================
resource "aws_iam_role" "vault_role" {
  name = "Titan-EC2-Vault-Role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "vault_write_policy" {
  name        = "Titan-EC2-Vault-Write-Policy"
  description = "Allows write-only access to the Titan Fintech S3 Vault"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["s3:PutObject"]
        Resource = ["${aws_s3_bucket.vault.arn}/*"] # Dynamic interpolation to target bucket objects
      }
    ]
  })
}

# Attaches the customized policy to our Role
resource "aws_iam_role_policy_attachment" "vault_policy_attach" {
  role       = aws_iam_role.vault_role.name
  policy_arn = aws_iam_policy.vault_write_policy.arn
}

# An Instance Profile is required to attach an IAM Role to an EC2 instance
resource "aws_iam_instance_profile" "vault_instance_profile" {
  name = "Titan-EC2-Vault-Instance-Profile"
  role = aws_iam_role.vault_role.name
}

# ==============================================================================
# PHASE 4: THE COMPUTE INSTANCE (Step 5)
# Launches Ubuntu with the dynamic AMI and attaches the Instance Profile
# ==============================================================================
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "app_server" {
  ami                  = data.aws_ami.ubuntu.id
  instance_type        = "t3.micro" # Keeps it free-tier compliant in us-east-1
  iam_instance_profile = aws_iam_instance_profile.vault_instance_profile.name

  tags = {
    Name = "Titan-Fintech-App-Server"
  }
}
