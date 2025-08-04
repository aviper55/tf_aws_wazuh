# Assessment: Wazuh on AWS with Terraform

## Overview
This project provisions a secure AWS environment for running Wazuh using Docker Compose on an EC2 instance with a git actions pipepline for basic testing.

## Directory Structure
```
assessment/
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── provider.tf
├── scripts/
│   └── setup.sh
├── docker/
│   └── docker-compose.yml
└── README.md
```

## Setup Instructions
1. **Configure AWS credentials** (e.g., using `aws configure`).
2. **Edit `terraform/variables.tf`** to set your S3 bucket name and region.
3. **Initialize Terraform:**
   ```sh
   cd assessment/terraform
   terraform init
   ```
4. **Apply Terraform:**
   ```sh
   terraform apply
   ```
5. **Connect to EC2 via SSM:**
   Use AWS Systems Manager Session Manager to access the instance (no SSH required).
6. **Run the setup script:**
   ```sh
   bash /path/to/scripts/setup.sh
   ```

## Access Information
- Wazuh will be available on the EC2 instance (private subnet).
- Use SSM Session Manager for access.

## Basic Testing Steps
- Confirm EC2 instance is running and SSM is enabled.
- Check Docker and Wazuh containers are running (`docker ps`).
- Access Wazuh dashboard via port forwarding or a bastion if needed.

## Cleanup
To destroy all resources:
```sh
terraform destroy
```

