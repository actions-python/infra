module "tfe_workspace_github" {
  source              = "./modules/terraform-cloud-workspace"
  organization        = tfe_organization.actions_python.name
  name                = "github"
  execution_mode      = "remote"
  global_remote_state = false
  terraform_version   = ">= 1.6.0"

  variables = [
    {
      key         = "actions_python_ci_app_id"
      value       = "407232"
      category    = "terraform"
      description = "ID of the GitHub App"
    },
    {
      key         = "actions_python_ci_app_pem_file"
      value       = null # Value was manually edited in Terraform Cloud console
      category    = "terraform"
      sensitive   = true
      description = "PEM file content used by GitHub App"
    },
    {
      key         = "app_terraform_io_token"
      value       = tfe_organization_token.actions_python.token
      category    = "terraform"
      sensitive   = true
      description = "Token for Terraform Cloud"
    },
    {
      key         = "GITHUB_APP_ID"
      value       = "407232"
      category    = "env"
      description = "ID of the GitHub App"
    },
    {
      key         = "GITHUB_APP_INSTALLATION_ID"
      value       = "42817202"
      category    = "env"
      description = "ID of the GitHub App installation"
    },
    {
      key         = "GITHUB_APP_PEM_FILE"
      value       = null # Value was manually edited in Terraform Cloud console
      category    = "env"
      sensitive   = true
      description = "PEM file content used by GitHub App"
    },
    {
      key         = "GITHUB_OWNER"
      value       = "actions-python"
      category    = "env"
      description = "The name of GitHub owner or organization"
    },
  ]
}

module "tfe_workspace_terraform_cloud" {
  source              = "./modules/terraform-cloud-workspace"
  organization        = tfe_organization.actions_python.name
  name                = "terraform-cloud"
  execution_mode      = "remote"
  global_remote_state = true
  terraform_version   = ">= 1.6.0"

  variables = [
    {
      key         = "TFE_TOKEN"
      value       = tfe_organization_token.actions_python.token
      category    = "env"
      sensitive   = true
      description = "Token for Terraform Cloud"
    },
  ]
}
