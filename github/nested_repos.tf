module "github_repository_hello_world_python_action" {
  source      = "./modules/github-repository"
  name        = "hello-world-python-action"
  description = "A template to demonstrate how to build a Python action"
  is_template = true

  branches = [
    {
      name       = "main"
      default    = true
      protection = {}
    }
  ]
}

module "github_repository_infra" {
  source      = "./modules/github-repository"
  name        = "infra"
  description = "An infrastructure as code for GitHub Actions Python"

  branches = [
    {
      name    = "main"
      default = true
      protection = {
        require_signed_commits        = true
        required_pull_request_reviews = { require_code_owner_reviews = true }
      }
    }
  ]

  collaborators = [
    { permission = "push", team_id = github_team.reviewers.slug },
  ]

  secrets = [
    { name = "ACTIONS_PYTHON_CI_APP_ID", value = local.secrets.github_app_id },
    { name = "ACTIONS_PYTHON_CI_APP_PEM_FILE", value = replace(local.secrets.github_app_pem_file, "\\n", "\n") },
    { name = "APP_TERRAFORM_IO_TOKEN", value = local.secrets.app_terraform_io_token },
  ]
}

module "github_repository_python_action" {
  source      = "./modules/github-repository"
  name        = "python-action"
  description = "Create a Python Action with tests, linting, workflow, and publishing"
  is_template = true

  branches = [
    {
      name       = "main"
      default    = true
      protection = {}
    }
  ]
}

module "github_repository_toolkit" {
  source      = "./modules/github-repository"
  name        = "toolkit"
  description = "Python implemention for https://github.com/actions/toolkit"

  branches = [
    {
      name       = "main"
      default    = true
      protection = {}
    }
  ]

  collaborators = [
    { permission = "push", team_id = github_team.reviewers.slug },
  ]
}
