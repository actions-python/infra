terraform {
  required_version = "~> 1.1"

  cloud {
    hostname     = "app.terraform.io"
    organization = "actions-python"

    workspaces {
      name = "terraform-cloud"
    }
  }

  required_providers {
    hcp = {
      source  = "registry.terraform.io/hashicorp/hcp"
      version = "~> 0.73.0"
    }

    tfe = {
      source  = "registry.terraform.io/hashicorp/tfe"
      version = "~> 0.49.0"
    }
  }
}

provider "hcp" {}

provider "tfe" {
  hostname = "app.terraform.io"
}
