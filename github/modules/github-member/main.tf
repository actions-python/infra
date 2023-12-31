terraform {
  required_version = "~> 1.1"

  required_providers {
    github = {
      source  = "registry.terraform.io/integrations/github"
      version = "~> 5.0"
    }
  }
}

resource "github_membership" "default" {
  username = var.username
  role     = var.organization_role
}

data "github_team" "default" {
  for_each = { for team in var.teams : team.slug => team }
  slug     = each.value.slug
}

resource "github_team_membership" "default" {
  for_each = { for team in var.teams : team.slug => team }
  team_id  = data.github_team.default[each.value.slug].id
  username = var.username
  role     = each.value.role
}
