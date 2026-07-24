# 👁️ The Monitored Fortress — Secure & Telemetried AWS Network Infrastructure

Hands-on cloud security engineering project demonstrating the implementation of **declarative Infrastructure as Code (Terraform), full-network telemetry via VPC Flow Logs, and Zero Trust compute access via AWS Systems Manager (SSM)** on AWS.

This repository reflects the successful construction of a production network for "Titan FinTech," engineered with zero inbound security group rules, explicit network segmentation, continuous CloudWatch traffic logging, and secure interactive shell access without exposing public management ports or traditional SSH key pairs.

---

## 🎯 Objective
Act as the Lead Cloud Security Architect to design, deploy, and verify a secure, monitored network perimeter on AWS. The mission focused on establishing isolated network boundaries via VPC and Subnet configurations, embedding passive wiretapping telemetries via VPC Flow Logs and CloudWatch, and provisioning an EC2 compute instance adhering strictly to Zero Trust remote administration principles (reachable exclusively through AWS Systems Manager Session Manager).

---

## 🛠️ What I Built / Investigated
*   **Engineered the Network Perimeter:** Defined an isolated `aws_vpc` (`10.0.0.0/16`), a public `aws_subnet` (`10.0.1.0/24`), an attached `aws_internet_gateway`, and explicit route tables ensuring controlled outbound connectivity for internal systems.
*   **Constructed a Cloud Watchtower (Wiretap):** Provisioned a dedicated CloudWatch Log Group (`/tkh/titan-prod-vpc-logs`) paired with a `1-day` retention lifecycle policy to optimize storage costs, and attached an `aws_flow_log` resource to capture **ALL** inbound/outbound network traffic across the VPC.
*   **Implemented IAM Service Delegation:** Utilized dedicated IAM roles (`TKH-Titan-FlowLog-Role` and `TKH-Titan-SSM-Role`) configured with dynamic assume-role trust policies, granting least-privilege permissions for Flow Logs to publish to CloudWatch and EC2 instances to communicate with Systems Manager.
*   **Enforced a Zero Trust Inbound Security Posture:** Authored a perimeter `aws_security_group` featuring an explicit egress-only rule (`0.0.0.0/0`) and **ZERO** inbound ingress rules, eliminating attack surface exposures like exposed SSH (Port 22).
*   **Deployed Identity-Managed Compute Nodes:** Provisioned an Ubuntu 22.04 LTS app server in the public subnet, associating it directly with an IAM Instance Profile (`TKH-Titan-SSM-Profile`) containing the `AmazonSSMManagedInstanceCore` policy.
*   **Validated Out-of-Band Interactive Access:** Authenticated into the AWS Console to open an interactive web shell via **AWS Systems Manager Session Manager**, running terminal commands (`whoami`) directly inside the instance without requiring open inbound ports or SSH keys.
*   **Audited Live Telemetry Capture:** Navigated to CloudWatch Log Groups to confirm active VPC Flow Log streams capturing real-time network traffic across the infrastructure.
*   **Executed Clean Teardown Operations:** Executed automated resource destruction to enforce strict lifecycle control, guaranteeing zero residual billing or lingering orphaned cloud assets.

---

## 📂 Repository Structure

The files within this repository are structured as follows:

<pre>
tlab-06-monitored-fortress/
├── main.tf                    # Hardened network, wiretap, and Zero Trust compute configuration
├── iam_provided.tf            # Provided IAM roles for Flow Log publishing and SSM identity delegation
├── ssm_terminal_proof.png     # Visual proof of interactive Session Manager terminal ('whoami' as ssm-user)
├── cloudwatch_flow_logs.png   # AWS CloudWatch console screenshot proving active VPC Flow Log capture
└── destroy_verification.png   # CLI terminal output verifying 100% clean 'terraform destroy'
</pre>

*   [`main.tf`](./main.tf) → Declarative HCL file defining the VPC, IGW, Subnet, Route Table, CloudWatch Log Group, VPC Flow Log engine, Zero-Inbound Security Group, and SSM-enabled EC2 instance.
*   [`iam_provided.tf`](./iam_provided.tf) → IAM infrastructure defining trust policies and managed policy attachments for logging and Systems Manager access.
*   `ssm_terminal_proof.png` → Full-screen capture proving out-of-band interactive shell connection via AWS Systems Manager Session Manager (`ssm-user`).
*   `cloudwatch_flow_logs.png` → Verification of real-time network traffic logs being published directly to CloudWatch.
*   `destroy_verification.png` → Proof of successful resource teardown confirming all created AWS assets were safely destroyed.

---

## 💡 What This Proves
I can:
*   **Design Multi-Tier Cloud Architectures:** Write production-grade HCL establishing network perimeters, routing tables, dynamic AMI lookups, and compute instances in a single modular code base.
*   **Implement Zero Trust Access Models:** Eliminate reliance on public administrative interfaces (SSH/RDP) by leveraging IAM identity-based management planes like AWS Systems Manager.
*   **Deploy Network Security Telemetry:** Provision passive monitoring systems at the network layer to capture full audit trails (VPC Flow Logs) without impacting instance performance.
*   **Manage Infrastructure Dependencies:** Coordinate multi-file Terraform deployments (`main.tf` and `iam_provided.tf`) while referencing implicit and explicit resource dependencies seamlessly.
*   **Govern Cloud Resource Lifecycles:** Track state, audit running resources, and execute safe infrastructure destruction commands to enforce cost hygiene.

---

## 🚀 Outcome
Successfully deployed a highly secure, telemetried, and Zero Trust-compliant network architecture for Titan FinTech:
*   **Zero Inbound Attack Surface:** Completely isolated the compute tier from external network scans while maintaining full administrative reachability via AWS Systems Manager.
*   **Comprehensive Visibility:** Enabled continuous, real-time packet-flow telemetry across all network interfaces for threat monitoring and incident response readiness.
*   **Operational Discipline:** Validated live connectivity, confirmed active log capturing, and cleanly destroyed the environment to protect the operational lab stipend.
