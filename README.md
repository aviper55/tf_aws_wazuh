# tf_aws_wazuh

This repository contains infrastructure-as-code and automation for deploying a secure Wazuh stack on AWS using Terraform and Docker Compose.

## Structure
- `assessment/README.md`: Detailed setup, configuration, and usage instructions for the Wazuh on AWS solution. **Use this file for step-by-step deployment and operational guidance.**
- `assessment/terraform/`: Terraform code for provisioning AWS resources (VPC, EC2, IAM, S3, etc.).
- `assessment/docker/`: Docker Compose files and configuration for Wazuh single-node deployment, including certificate generation.
- `assessment/scripts/`: Automation scripts for installing Docker, generating certificates, and deploying the stack.

## CI/CD Pipeline
A GitHub Actions workflow (`.github/workflows/ci.yml`) is included to:
- Validate Terraform code (without using the remote backend).
- Build and test the Wazuh Docker Compose stack in a temporary environment.
- Run health checks on the Wazuh manager and dashboard containers.
- Print logs for easier debugging if any step fails.

**Note:** The pipeline is for validation and basic testing. For full production deployment, follow the instructions in `assessment/README.md`.

---
For full deployment and operational details, see [`assessment/README.md`](assessment/README.md).
