terraform {
  required_version = "~>1.1.4"

  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.27.0"
    }
  }

  cloud {
    organization = "whackjack-root"
    workspaces {
      name = "tfc-organization"
    }
  }
}

provider tfe {
  token = var.tfe_token
}
