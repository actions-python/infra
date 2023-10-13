resource "github_repository" "default" {
  name            = var.name
  description     = var.description
  homepage_url    = var.homepage_url
  visibility      = var.visibility
  has_issues      = var.has_issues
  has_discussions = var.has_discussions
  has_projects    = false
  has_wiki        = false
  is_template     = var.is_template

  allow_merge_commit          = false
  allow_squash_merge          = true
  allow_rebase_merge          = false
  allow_auto_merge            = true
  squash_merge_commit_title   = "PR_TITLE"
  squash_merge_commit_message = "PR_BODY"
  delete_branch_on_merge      = true

  archived = var.archived
  topics   = var.topics

  vulnerability_alerts = true
  allow_update_branch  = true

  security_and_analysis {
    secret_scanning {
      status = "enabled"
    }
    secret_scanning_push_protection {
      status = "enabled"
    }
  }
}

resource "github_repository_dependabot_security_updates" "default" {
  repository = github_repository.default.id
  enabled    = true
}

resource "github_actions_secret" "default" {
  for_each        = { for secret in var.secrets : secret.name => secret }
  repository      = github_repository.default.name
  secret_name     = each.key
  plaintext_value = each.value.value
}
