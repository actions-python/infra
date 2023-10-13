locals {
  secrets = { for secret in data.hcp_vault_secrets_secret.infra : secret.secret_name => secret.secret_value }
}

data "hcp_vault_secrets_secret" "infra" {
  for_each = toset([
    "app_terraform_io_token",
    "github_app_id",
    "github_app_installation_id",
    "github_app_pem_file",
    "hcp_client_id",
    "hcp_client_secret",
  ])
  app_name    = "infra"
  secret_name = each.value
}
