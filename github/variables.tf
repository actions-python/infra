variable "github_provider_app_id" {
  type        = string
  sensitive   = true
  description = "ID of the GitHub App"
}

variable "github_provider_app_installation_id" {
  type        = string
  sensitive   = true
  description = "ID of the GitHub App installation"
}

variable "github_provider_app_pem_file" {
  type        = string
  sensitive   = true
  description = "GitHub App private key PEM file content"
}

variable "app_terraform_io_token" {
  type        = string
  sensitive   = true
  description = "Terraform Cloud api token for organization"
}
