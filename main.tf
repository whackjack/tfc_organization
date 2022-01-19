data "tfe_organization" "org" {
  name = var.organization
}

resource "tfe_oauth_client" "github" {
  organization = data.tfe_organization.org.name
  api_url      = "https://api.github.com"
  http_url     = "https://github.com"
  oauth_token  = "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"
  service_provider = "github"
}
