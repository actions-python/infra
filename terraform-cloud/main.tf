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
    tfe = {
      source  = "registry.terraform.io/hashicorp/tfe"
      version = "~> 0.49.0"
    }
  }
}

provider "tfe" {
  hostname = "app.terraform.io"
}
