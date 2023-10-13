variable "username" {
  type        = string
  description = "GitHub username"
}

variable "organization_role" {
  type        = string
  default     = "member"
  description = "GitHub role in organization"
}

variable "teams" {
  type = list(object({
    slug = string
    role = string
  }))
  default     = []
  description = "GitHub team configurations"
}
