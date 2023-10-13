resource "github_actions_secret" "default" {
  for_each        = { for secret in var.secrets : secret.name => secret }
  repository      = github_repository.default.name
  secret_name     = each.key
  plaintext_value = each.value.value
}

resource "github_dependabot_secret" "default" {
  for_each        = { for secret in var.secrets : secret.name => secret }
  repository      = github_repository.default.name
  secret_name     = each.key
  plaintext_value = each.value.value
}
