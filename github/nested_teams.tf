resource "github_team" "maintainers" {
  name        = "Maintainers"
  description = "GitHub Actions Python maintainers"
  privacy     = "closed"
}

resource "github_team" "reviewers" {
  name        = "Reviewers"
  description = "GitHub Actions Python reviewers"
  privacy     = "closed"
}

module "github_member_sudosubin" {
  source            = "./modules/github-member"
  username          = "sudosubin"
  organization_role = "admin"
  team_id           = github_team.maintainers.id
  team_role         = "maintainer"
}
