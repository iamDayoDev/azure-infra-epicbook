# Azure Infra Epicbook

Terraform configuration for a simple Azure environment with:

- A resource group
- A virtual network with app and database subnets
- A Linux virtual machine
- An Azure Database for MySQL Flexible Server with private DNS
- Remote Terraform state stored in Azure Storage

## Project Files

- `providers.tf`: Terraform and Azure provider requirements
- `backend.tf`: Azure remote backend configuration
- `main.tf`: Core infrastructure resources
- `database.tf`: Database subnet, NSG, DNS, and MySQL server
- `variables.tf`: Input variables
- `outputs.tf`: Useful deployment outputs
- `terraform.tfvars.example`: Example variable values

## Before You Run

1. Create the Azure Storage account and container referenced in `backend.tf`.
2. Copy `terraform.tfvars.example` to `terraform.tfvars` and update the values.
3. Make sure your SSH public key exists at the configured path or set `ssh_public_key` explicitly.
4. Authenticate to Azure with `az login`.

## Commands

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

## Notes

- `terraform.tfvars` is ignored to help avoid committing secrets.
- Backend resources must already exist before `terraform init` succeeds.
- Rotate any real passwords that may have already been shared or committed elsewhere.
