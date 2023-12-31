resource "github_branch" "default" {
  for_each   = { for branch in var.branches : branch.name => branch }
  repository = github_repository.default.name
  branch     = each.key
}

resource "github_branch_default" "default" {
  for_each   = { for branch in var.branches : branch.name => branch if branch["default"] }
  repository = github_repository.default.name
  branch     = each.value.name

  depends_on = [
    github_branch.default
  ]
}

resource "github_branch_protection" "default" {
  for_each                        = { for branch in var.branches : branch.name => branch if branch["protection"] != null }
  repository_id                   = github_repository.default.node_id
  pattern                         = each.value.name
  require_signed_commits          = each.value.protection.require_signed_commits
  required_linear_history         = each.value.protection.required_linear_history
  require_conversation_resolution = each.value.protection.require_conversation_resolution
  allows_deletions                = false

  dynamic "required_pull_request_reviews" {
    for_each = (
      each.value.protection.required_pull_request_reviews != null
      ? [each.value.protection.required_pull_request_reviews]
      : []
    )

    content {
      dismiss_stale_reviews      = true
      require_code_owner_reviews = required_pull_request_reviews.value.require_code_owner_reviews
    }
  }

  depends_on = [
    github_branch.default
  ]
}
