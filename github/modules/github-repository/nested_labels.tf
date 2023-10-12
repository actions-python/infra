resource "github_issue_label" "default" {
  for_each    = { for label in var.labels : label.name => label }
  repository  = github_repository.default.name
  name        = each.value.name
  color       = each.value.color
  description = each.value.description
}
