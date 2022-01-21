variable "organization" {
  type    = string
  default = "whackjack-root"
}

variable "github_oauth_token" {
  type = string
  sensitive = true
}

variable "tfe_token" {
  type = string
  sensitive = true
}
