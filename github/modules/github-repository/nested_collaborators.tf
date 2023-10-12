resource "github_repository_collaborators" "default" {
  repository = github_repository.default.name

  dynamic "team" {
    for_each = var.collaborators

    content {
      permission = team.value.permission
      team_id    = team.value.team_id
    }
  }
}
