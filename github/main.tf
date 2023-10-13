terraform {
  required_version = "~> 1.1"

  cloud {
    hostname     = "app.terraform.io"
    organization = "actions-python"

    workspaces {
      name = "github"
    }
  }

  required_providers {
    github = {
      source  = "registry.terraform.io/integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  owner = "actions-python"
  app_auth {
    id              = null
    installation_id = null
    pem_file        = null
  }
}
