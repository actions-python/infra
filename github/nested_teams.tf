resource "github_team" "maintainers" {
  name        = "maintainers"
  description = "GitHub Actions Python maintainers"
  privacy     = "closed"
}

resource "github_team" "reviewers" {
  name        = "reviewers"
  description = "GitHub Actions Python reviewers"
  privacy     = "closed"
}

module "github_member_sudosubin" {
  source            = "./modules/github-member"
  username          = "sudosubin"
  organization_role = "admin"
  teams = [
    { slug = github_team.maintainers.slug, role = "maintainer" },
    { slug = github_team.reviewers.slug, role = "maintainer" },
  ]
}
