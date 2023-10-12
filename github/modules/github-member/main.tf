terraform {
  required_providers {
    github = {
      source = "integrations/github"
    }
  }
}

resource "github_membership" "default" {
  username = var.username
  role     = var.organization_role
}

resource "github_team_membership" "default" {
  team_id  = var.team_id
  username = var.username
  role     = var.team_role
}
