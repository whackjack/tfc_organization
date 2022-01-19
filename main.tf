data "tfe_organization" "org" {
  name = "whackjack"
}

resource "tfe_workspace" "tfe_workspaces" {
  name = "tfe-workspaces"
  organization = data.tfe_organization.org.name
}
