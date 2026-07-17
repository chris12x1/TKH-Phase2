# ☁️ Advanced Cloud Security & DevSecOps Portfolio — Christopher Diaz

Hands-on cloud security engineering portfolio demonstrating real-world experience in **secure AWS architecture, Infrastructure as Code (Terraform), identity governance (IAM), automated DevSecOps pipelines, and GRC framework alignment**.

This repository reflects comprehensive, scenario-based labs simulating **cloud-native network deployments, remote state-file synchronization, over-privileged IAM remediation, public-facing data exposures, and automated security auditing**.

---

## 👨‍💻 About Me

Cybersecurity-focused Cloud Security & DevSecOps Engineer with hands-on experience designing, deploying, and securing scalable, automated infrastructures within AWS.

Skilled in:
- **Infrastructure as Code (IaC)** — Writing declarative, modular Terraform (HCL) configurations to deploy secure, reproducible multi-tier cloud topographies.
- **Identity & Access Management (IAM)** — Crafting surgical, JSON-based Least Privilege policies and role-based access control (RBAC) schemas to eliminate wildcard exposures.
- **Secure Cloud Networking** — Architecting hardened Virtual Private Clouds (VPCs) featuring isolated private subnets, secure NAT Gateways, and stateful Security Groups.
- **DevSecOps & CI/CD Pipelines** — Integrating automated SAST security scanning, container auditing, and static IaC analysis directly into GitHub Actions pipelines.
- **Cloud Governance, Risk, & Compliance (GRC)** — Mapping cloud infrastructure security baselines and control mechanisms to NIST CSF 2.0 and CIS Benchmarks.

---

## 🧰 Technologies & Tools

**Cloud Provider Platforms**
- Amazon Web Services (AWS: IAM, S3, EC2, VPC, KMS, CloudWatch)

**Infrastructure as Code (IaC) & Automation**
- HashiCorp Terraform (HCL Syntax, Remote State, Workspaces, Modules)
- Python 3.x, Bash Shell Scripting, YAML

**DevSecOps & Security Auditing Tools**
- Static Application Security Testing (SAST)
- IaC Vulnerability Scanning (`tfsec`, Checkov)
- GitHub Actions & CI/CD Pipelines

**Frameworks & Methodologies**
- NIST Cybersecurity Framework (NIST CSF 2.0)
- CIS AWS Foundations Benchmarks
- The AWS Shared Responsibility Model

---

## 📂 Repository Structure

The engineering artifacts, HCL scripts, and architectural documentations within this repository are structured chronologically by operational focus:

*   [**`Week1-Artifact/`**](./Week1-Artifact) → S3 storage bucket security, default-private configurations, and static website exposure triage.
*   [**`Week2-Artifact/`**](./Week2-Artifact) → AWS IAM Policy engineering, surgical JSON permission crafting, and Least Privilege auditing.
*   [**`Week3-Artifact/`**](./Week3-Artifact) → Terraform installation, environment initialization, local state lifecycle, and baseline IaC deployment.
*   [**`Week4-Artifact/`**](./Week4-Artifact) → Remote state management, secure locking backends via DynamoDB, and team-based IaC collaboration.
*   [**`Week5-Artifact/`**](./Week5-Artifact) → The Budgeted Identity: Multi-layer cost containment, custom IAM roles, EC2 profiles, and private-by-default S3 storage.
*   [**`Week6-Artifact/`**](./Week6-Artifact) → Hardened VPC architecture: Custom public/private subnetting, Internet Gateways, and route table enforcement.
*   [**`Week7-Artifact/`**](./Week7-Artifact) → Modular Terraform development: Reusable multi-environment modules and programmatic workspace separation.
*   [**`Week8-Artifact/`**](./Week8-Artifact) → Secure application delivery pipelines: CI/CD integration using GitHub Actions and AWS OpenID Connect.
*   [**`Week9-Artifact/`**](./Week9-Artifact) → Shift-Left security implementation: Automated pre-commit hooks, `tfsec` static analysis, and code quality gating.
*   [**`Week10-Artifact/`**](./Week10-Artifact) → GRC mapping and regulatory compliance audits aligned with NIST CSF 2.0 and CIS benchmarks.
*   [**`Week11-Artifact/`**](./Week11-Artifact) → AI Security: LLM prompt injection defense, malicious payload filtering, and model security boundaries.
*   [**`Week12-Artifact/`**](./Week12-Artifact) → Operation Titan: Secure, automated capstone web application deployment featuring integrated security scanning.

---

## 📌 Featured Engineering Milestones

### 💳 1. Financial Firewalls & Least Privilege Identity (Week 5)
*   **The Budgeted Identity:** Engineered a programmatic $10.00 USD monthly cost threshold utilizing `aws_budgets_budget` with real-time SMTP alerting mechanisms configured at 80% capacity to prevent "Denial of Wallet" vectors.
*   **Surgical Role Delegation:** Remediated legacy wildcard IAM users by provisioning a custom AWS role (`Titan-EC2-Vault-Role`) mapped strictly to the EC2 service principal.
*   **Secure S3 Vaulting:** Developed a private-by-default, dynamically randomized S3 storage bucket, and strictly bounded role read/write access to this S3 ARN using Terraform interpolation, enforcing absolute zero public exposure.

### 🗺️ 2. Disaster Recovery, Lockfiles, & Remote State (Week 4)
*   **Remote State Synchronization:** Migrated local workspace configurations to enterprise-grade remote S3 backends to protect state telemetry against host physical drive failures and maintain a single source of truth.
*   **Concurrent Write Prevention:** Configured active state locking mechanisms to block multi-user state corruption during simultaneous deployments.
*   **Disaster Simulation & Recovery:** Executed state-destruction simulations, successfully recovering missing state configurations back into a synchronized, live configuration utilizing targeted `terraform import` operations.

### 🛡️ 3. Multi-Tier Hardened VPC Infrastructure (Week 6)
*   **Network Isolation:** Architected an enterprise VPC utilizing segregated public and private subnet blocks to isolate sensitive database workloads from the public internet.
*   **Secure Routing Topology:** Provisioned NAT Gateways to grant outbound internet connectivity to backend compute nodes without exposing them to direct ingress paths, managing the routing traffic dynamically via custom route tables.

---

## 📊 Core Verified Artifact Summary

| Functional Focus | Core Artifact Reference | Technical Impact Description |
| :--- | :--- | :--- |
| **Infrastructure as Code** | [`main.tf`](./Week5-Artifact/main.tf) | Standardized HCL file deploying budgets, S3 buckets, custom IAM roles, and compute instances. |
| **Identity Governance** | [`iam_policy.json`](./Week2-Artifact/iam_policy.json) | Surgical JSON document implementing the Principle of Least Privilege for S3 upload behaviors. |
| **Network Security** | [`vpc_network.tf`](./Week6-Artifact/vpc_network.tf) | Complete VPC network design mapping public/private subnets and route boundaries. |
| **Security Scanning** | [`tfsec_scan.yml`](./Week9-Artifact/.github/workflows/tfsec_scan.yml) | CI/CD automation workflow evaluating Terraform definitions for vulnerabilities prior to main deployment. |
| **Compliance Auditing** | [`compliance_audit.md`](./Week10-Artifact/compliance_audit.md) | Operational audit mapping cloud security controls directly to the NIST CSF 2.0 framework. |

---

## 🎯 Career Objective

Highly technical, hands-on cloud-native security practitioner prepared to join an enterprise team as a **Cloud Security Analyst / SOC Analyst / DevSecOps Engineer / Junior Security Architect**. Ready to deploy deep experience in Infrastructure as Code, continuous delivery pipeline security, AWS access control structures, and strict GRC alignment to protect enterprise cloud environments.

---

## 📬 Let’s Connect

*   **GitHub Repository:** [github.com/chris12x1](https://github.com/chris12x1)
*   **Professional LinkedIn:** [linkedin.com/in/christopherdiaz87](https://linkedin.com/in/christopherdiaz87)
