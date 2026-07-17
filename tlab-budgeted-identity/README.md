# 💳 The Budgeted Identity — Secure AWS Cloud Infrastructure

Hands-on cloud security engineering project demonstrating the implementation of **declarative Infrastructure as Code (Terraform), surgical IAM least-privilege role delegation, dynamic resource provisioning, and programmatic cost-containment firewalls** on AWS.

This repository reflects the successful remediation of high-risk security flaws (wildcard IAM policies) and the deployment of a hardened, secure storage-vault architecture for "Titan FinTech" designed to mitigate both "Denial of Wallet" attacks and credential compromise.

---

## 🎯 Objective
Act as the Lead Cloud Security Architect to design, deploy, and verify a secure cloud-native storage vault on AWS. The mission focused on establishing strict financial boundaries via programmatic budget limits, remediating dangerously over-privileged wildcard IAM user policies, crafting a surgical, resource-specific write-only (`s3:PutObject`) IAM role, and provisioning an EC2 compute instance securely wearing that identity without hardcoding access keys.

---

## 🛠️ What I Built / Investigated
*   **Engineered a Financial Firewall:** Programmed a strict monthly budget of $10.00 USD using the `aws_budgets_budget` resource, pairing it with real-time SMTP alerting threshold blocks to send automatic notifications at 80% of actual spend to proactively defend against "Denial of Wallet" exploits.
*   **Dynamically Provisioned Private S3 Storage:** Engineered an `aws_s3_bucket` utilizing a `random_id` hex suffix generation block to guarantee globally unique naming, and enforced a default-deny posture on all public access configurations to prevent accidental data leaks.
*   **Remediated Wildcard IAM Sabotage:** Analyzed and systematically destroyed a dangerously insecure legacy service account containing unrestricted wildcard access permissions (`ec2:*` and `s3:*` across `*`).
*   **Crafted Least-Privilege Policies:** Penned a highly restricted, JSON-formatted IAM security policy allowing **only** the `s3:PutObject` action, scoped specifically to the ARN of the freshly created S3 vault via dynamic Terraform interpolation.
*   **Implemented Secure Role Delegation:** Created the `Titan-EC2-Vault-Role` with an EC2 trust policy and packaged it into an IAM Instance Profile, allowing compute nodes to securely acquire temporary security credentials.
*   **Deployed Compliant Compute Nodes:** Provisioned an Ubuntu-based application server utilizing a `t3.micro` instance type to remain strictly compliant with free-tier guardrails in the `us-east-1` region, linking the node directly to the IAM Instance Profile.
*   **Validated Live Infrastructure Security:** Authenticated into the AWS Console to perform a security audit, verifying that the EC2 instance successfully inherited the custom vault role.
*   **Executed Clean Teardown Operations:** Ran resource lifecycle destruction commands to guarantee absolute zero resource leakage or active billing footprints, protecting the $75 operational lab stipend.

---

## 📂 Repository Structure

The files within this repository are structured as follows:

<pre>
tlab-budgeted-identity/
├── main.tf                            # Hardened, complete Terraform configuration file
└── screenshots/
    ├── build_success.png              # CLI terminal output of a successful 'terraform apply'
    ├── security_audit.png             # AWS EC2 Console screenshot verifying IAM role association
    └── destroy_verification.png       # CLI terminal output verifying 100% clean 'terraform destroy'
</pre>

*   [`main.tf`](./main.tf) → Contains the entire declarative HCL file configuring the provider, programmatic budget, S3 storage vault, custom IAM role with least-privilege S3 permissions, and the EC2 app server.
*   `screenshots/build_success.png` → Screen capture showing the terminal after successfully initializing and executing the infrastructure build.
*   `screenshots/security_audit.png` → Visual verification of the AWS Web Console proving the instance is live and utilizing the `Titan-EC2-Vault-Role`.
*   `screenshots/destroy_verification.png` → Critical proof showing the successful teardown of all resources to avoid any billing leaks.

---

## 💡 What This Proves
I can:
*   **Write Production-Ready HCL:** Author structural Infrastructure as Code configurations using clean block formatting, variable/resource interpolation, and third-party provider integrations.
*   **Implement Cloud IAM Least-Privilege:** Move beyond broad administrative permissions to craft explicit, single-action JSON policies that limit resources only to what they structurally require.
*   **Protect Cloud Resources Financially:** Establish automated budget policies in code to alert stakeholders of cost runaways before they become financial disasters.
*   **Configure Instance Profiles:** Link IAM roles to compute instances, ensuring application code can interact with secure backend services without ever embedding hardcoded access keys in source control.
*   **Govern Cloud Resource Lifecycles:** Initialize, change, track, and cleanly decommission complex cloud architectures programmatically.

---

## 🚀 Outcome
Successfully deployed a highly secure, budgeted, and compliant infrastructure blueprint for Titan FinTech:
*   **Eliminated Security Blindspots:** Eradicated the threat of broad-resource privilege escalation by ensuring no root-level credentials or broad IAM policies remained.
*   **Enforced S3 Privacy:** Configured an isolated S3 vault with zero public ingress vectors, restricted strictly to receive uploads from our designated app server.
*   **Guaranteed Financial Discipline:** Established strict budget boundaries and cleanly destroyed the entire live environment to maintain 100% cost hygiene.
