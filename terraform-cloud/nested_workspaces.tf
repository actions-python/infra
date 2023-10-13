module "tfe_workspace_github" {
  source              = "./modules/terraform-cloud-workspace"
  organization        = tfe_organization.actions_python.name
  name                = "github"
  execution_mode      = "remote"
  global_remote_state = false
  terraform_version   = ">= 1.6.0"

  variables = [
    {
      key         = "GITHUB_APP_ID"
      value       = local.secrets.github_app_id
      category    = "env"
      description = "ID of the GitHub App"
    },
    {
      key         = "GITHUB_APP_INSTALLATION_ID"
      value       = local.secrets.github_app_installation_id
      category    = "env"
      description = "ID of the GitHub App installation"
    },
    {
      key         = "GITHUB_APP_PEM_FILE"
      value       = local.secrets.github_app_pem_file
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
    {
      key         = "HCP_CLIENT_ID"
      value       = local.secrets.hcp_client_id
      category    = "env"
      sensitive   = true
      description = "HCP Client Id"
    },
    {
      key         = "HCP_CLIENT_SECRET"
      value       = local.secrets.hcp_client_secret
      category    = "env"
      sensitive   = true
      description = "HCP Client Secret"
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
      key         = "HCP_CLIENT_ID"
      value       = local.secrets.hcp_client_id
      category    = "env"
      sensitive   = true
      description = "HCP Client Id"
    },
    {
      key         = "HCP_CLIENT_SECRET"
      value       = local.secrets.hcp_client_secret
      category    = "env"
      sensitive   = true
      description = "HCP Client Secret"
    },
    {
      key         = "TFE_TOKEN"
      value       = local.secrets.app_terraform_io_token
      category    = "env"
      sensitive   = true
      description = "Token for Terraform Cloud"
    },
  ]
}
