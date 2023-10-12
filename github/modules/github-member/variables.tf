variable "username" {
  type = string
}

variable "organization_role" {
  type    = string
  default = "member"
}

variable "teams" {
  type = list(object({
    slug = string
    role = string
  }))
  default = []
}
