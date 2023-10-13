variable "organization" {
  type        = string
  description = "Name of the organization"
}

variable "name" {
  type        = string
  description = "Name of the workspace"
}

variable "execution_mode" {
  type        = string
  description = "Which execution mode to use"

  validation {
    condition     = contains(["local", "remote"], var.execution_mode)
    error_message = "Allowed values for execution_mode are \"local\" or \"remote\"."
  }
}

variable "global_remote_state" {
  type        = bool
  default     = false
  description = "Whether the workspace allows to share state in the organization"
}

variable "terraform_version" {
  type        = string
  default     = ">= 1.6.0"
  description = "The version of Terraform to use"
}

variable "variables" {
  type = list(object({
    key         = string
    value       = string
    category    = string
    hcl         = optional(bool, false)
    sensitive   = optional(bool, false)
    description = optional(string, "")
  }))
  default     = []
  description = "A set of variable to use in this workspace"
}
