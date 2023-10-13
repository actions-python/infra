variable "actions_python_ci_app_id" {
  type        = string
  description = "ID of the GitHub App"
}

variable "actions_python_ci_app_pem_file" {
  type        = string
  description = "PEM file content used by GitHub App"
}

variable "app_terraform_io_token" {
  type        = string
  sensitive   = true
  description = "Token for Terraform Cloud"
}
