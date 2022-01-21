data tfe_organization org {
  name = var.organization
}

resource tfe_oauth_client github {
  organization     = data.tfe_organization.org.name
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.github_oauth_token
  service_provider = "github"
}

resource tfe_workspace tfc_organization {
  name               = "tfc-organization"
  organization       = data.tfe_organization.org.name
  allow_destroy_plan = false
  vcs_repo {
    identifier     = "whackjack/tfc_organization"
    oauth_token_id = tfe_oauth_client.github.oauth_token_id
  }
}

resource tfe_variable github_oauth_token {
  key = "github_oauth_token"
  value = var.github_oauth_token
  category = "terraform"
  sensitive = true
  workspace_id = tfe_workspace.tfc_organization.id
}

resource tfe_variable tfe_token {
  key = "tfe_token"
  value = var.tfe_token
  category = "terraform"
  sensitive = true
  workspace_id = tfe_workspace.tfc_organization.id
}
