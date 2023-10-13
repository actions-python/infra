terraform {
  required_version = "~> 1.1"

  required_providers {
    github = {
      source  = "registry.terraform.io/integrations/github"
      version = "~> 5.0"
    }
  }
}
