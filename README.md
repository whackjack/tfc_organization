# tfc_organization

Manages various resources in Terraform Cloud.

This terraform module resides in a root organization and manages other organizations/workspaces.
These scripts are authoritative for organization and workspace definition.

## Bootstrapping

Follow these steps to bootstrap a new Terraform-managed Terraform Cloud account

1. Create a root organization in Terraform Cloud
2. Create an API token in Terraform Cloud, store safely for use later
3. Create a Personal Access Token in Github, with full repo permissions, store safely for use later
4. Configure root organization in terraform variables
5. Comment out `cloud` configuration block in `providers.tf`
6. Run `terraform init`
7. Run `TFE_TOKEN=XXXXX terraform plan`, inserting the Terraform Cloud API token from earlier, and verify plan
8. Run `TFE_TOKEN=XXXXX terraform apply`, with Terraform Cloud token, verify results
9. Un-comment `cloud` block from step 5, making sure to configure organization name
10. Commit changes to git repo
11. Run `TFE_TOKEN=XXXXX terraform init` again to start state migration to Terraform Cloud
