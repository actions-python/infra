module "github_repository_hello_world_python_action" {
  source      = "./modules/github-repository"
  name        = "hello-world-python-action"
  description = "A template to demonstrate how to build a Python action"

  branches = [
    {
      name    = "main",
      default = true,
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
      name    = "main",
      default = true,
      protection = {
        require_signed_commits          = true
        required_linear_history         = true
        require_conversation_resolution = true
        required_pull_request_reviews   = { require_code_owner_reviews = true }
      }
    }
  ]
}

resource "github_actions_secret" "infra" {
  repository      = module.github_repository_infra.github_repository.name
  secret_name     = "APP_TERRAFORM_IO_TOKEN"
  plaintext_value = var.app_terraform_io_token
}

module "github_repository_python_action" {
  source      = "./modules/github-repository"
  name        = "python-action"
  description = "Create a Python Action with tests, linting, workflow, and publishing"

  branches = [
    {
      name    = "main",
      default = true,
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
      name    = "main",
      default = true,
      protection = {
        require_signed_commits          = false
        required_linear_history         = true
        require_conversation_resolution = false
        required_pull_request_reviews   = { require_code_owner_reviews = false }
      }
    }
  ]
}
