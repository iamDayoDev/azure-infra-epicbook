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
2. Review the committed `terraform.tfvars` and adjust the non-sensitive values for your environment.
3. Supply `db_password` securely through an environment variable such as `TF_VAR_db_password` or through Azure DevOps secrets.
4. Make sure your SSH public key exists at the configured path or set `ssh_public_key` explicitly.
5. Authenticate to Azure with `az login`.

## Commands

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

## Notes

- `terraform.tfvars` is safe to commit here because it contains only non-sensitive values.
- Keep `db_password` out of source control and provide it through `TF_VAR_db_password` or Azure DevOps secrets.
- Backend resources must already exist before `terraform init` succeeds.
- Rotate any real passwords that may have already been shared or committed elsewhere.

## Azure DevOps Pipeline

This repo includes [infra-pipeline.yml](/c:/Users/USER/Desktop/azure-infra-epicbook/infra-pipeline.yml:1) for Azure DevOps.

Before running it, set up:

1. A Linux self-hosted agent pool named `SelfHostedPool`, or update the pool name in the pipeline.
2. An Azure Resource Manager service connection named `azure-devops-connection`, or update the variable in the pipeline.
3. A variable group named `epicbook-secrets` containing the secret variable `dbPassword`.
4. A secure file containing your SSH public key, matching `id_ed25519.pub` or the `sshPublicKeySecureFile` variable in the pipeline.
5. Service-connection access to both the target subscription and the backend storage account used in `backend.tf`.
