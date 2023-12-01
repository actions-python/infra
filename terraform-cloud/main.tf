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
      version = "~> 0.77.0"
    }

    tfe = {
      source  = "registry.terraform.io/hashicorp/tfe"
      version = "~> 0.50.0"
    }
  }
}

provider "hcp" {}

provider "tfe" {
  hostname = "app.terraform.io"
}
