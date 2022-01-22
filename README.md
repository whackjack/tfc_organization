# tfc_organization

Manages various resources in Terraform Cloud.

This terraform module resides in a root organization and manages other organizations/workspaces.
These scripts are authoritative for organization and workspace definition.

## Bootstrapping

Follow these steps to bootstrap a new Terraform-managed Terraform Cloud account

0. Run `terraform login` to generate a local token (if not already done)
1. Create a root organization in Terraform Cloud
2. Create an Organization API token in Terraform Cloud, store safely for use later
3. Create a Personal Access Token in Github, with full repo permissions, store safely for use later
4. Configure root organization in terraform variables
4a. (Optional) Put Terraform Cloud API token and GitHub Personal Access token into .tfvars file
5. Comment out `cloud` configuration block in `providers.tf`
6. Run `terraform init`
7. Run `terraform plan` and verify plan
8. Run `terraform apply` and verify results
9. Go into Terraform Cloud UI and cancel first pending run (we want to migrate the state later)
10. Un-comment `cloud` block from step 5, making sure to configure organization name
11. Commit changes to git repo
12. Run `terraform init` again to migrate state to Terraform Cloud
