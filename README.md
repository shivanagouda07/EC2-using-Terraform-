# EC2-using-Terraform-
### File Responsibilities
- **provider.tf** – Configures the AWS provider and region
- **main.tf** – Defines AWS resources (EC2 instance)
- **variables.tf** – Declares input variables
- **terraform.tfvars** – Assigns values to variables

### What This Project Does
- Provisions an EC2 instance using Terraform
- Uses variable-based configuration (no hardcoding)
- Follows Infrastructure as Code (IaC) best practices

### Prerequisites
- AWS account (Free Tier)
- Terraform installed
- AWS credentials configured

### How to Run
```bash
terraform init
terraform plan
terraform apply
terraform destroy
