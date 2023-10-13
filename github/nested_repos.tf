module "github_repository_hello_world_python_action" {
  source      = "./modules/github-repository"
  name        = "hello-world-python-action"
  description = "A template to demonstrate how to build a Python action"
  is_template = true

  branches = [
    {
      name    = "main"
      default = true
      protection = {
        require_signed_commits          = false
        required_linear_history         = true
        require_conversation_resolution = false
        required_pull_request_reviews   = { require_code_owner_reviews = false }
      }
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
        require_signed_commits          = true
        required_linear_history         = true
        require_conversation_resolution = true
        required_pull_request_reviews   = { require_code_owner_reviews = true }
      }
    }
  ]

  collaborators = [
    { permission = "push", team_id = github_team.reviewers.slug },
  ]

  secrets = [
    { name = "APP_TERRAFORM_IO_TOKEN", value = var.app_terraform_io_token },
    { name = "ACTIONS_PYTHON_CI_APP_ID", value = var.github_provider_app_id },
    { name = "ACTIONS_PYTHON_CI_PRIVATE_KEY", value = var.github_provider_app_pem_file },
  ]
}

module "github_repository_python_action" {
  source      = "./modules/github-repository"
  name        = "python-action"
  description = "Create a Python Action with tests, linting, workflow, and publishing"
  is_template = true

  branches = [
    {
      name    = "main"
      default = true
      protection = {
        require_signed_commits          = false
        required_linear_history         = true
        require_conversation_resolution = false
        required_pull_request_reviews   = { require_code_owner_reviews = false }
      }
    }
  ]
}

module "github_repository_toolkit" {
  source      = "./modules/github-repository"
  name        = "toolkit"
  description = "Python implemention for https://github.com/actions/toolkit"

  branches = [
    {
      name    = "main"
      default = true
      protection = {
        require_signed_commits          = false
        required_linear_history         = true
        require_conversation_resolution = false
        required_pull_request_reviews   = { require_code_owner_reviews = false }
      }
    }
  ]
}
