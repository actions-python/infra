data "hcp_vault_secrets_secret" "infra" {
  for_each = toset([
    "app_terraform_io_token",
    "github_app_id",
    "github_app_pem_file",
  ])
  app_name    = "infra"
  secret_name = each.value
}

locals {
  secrets = { for secret in data.hcp_vault_secrets_secret.infra : secret.secret_name => secret.secret_value }
}
