variable "name" {
  type = string
}

variable "description" {
  type    = string
  default = null
}

variable "homepage_url" {
  type    = string
  default = null
}

variable "visibility" {
  type    = string
  default = "public"

  validation {
    condition     = contains(["public", "private"], var.visibility)
    error_message = "Allowed values for visibility are \"public\" or \"private\"."
  }
}

variable "has_issues" {
  type    = bool
  default = true
}

variable "has_discussions" {
  type    = bool
  default = false
}

variable "is_template" {
  type    = bool
  default = false
}

variable "archived" {
  type    = bool
  default = false
}

variable "topics" {
  type    = list(string)
  default = []
}

variable "branches" {
  type = list(object({
    name    = string
    default = bool
    protection = optional(object({
      require_signed_commits          = bool
      required_linear_history         = bool
      require_conversation_resolution = bool
      required_pull_request_reviews = optional(object({
        require_code_owner_reviews = bool
      }))
    }))
  }))
  default = []
}

variable "labels" {
  type = list(object({
    name        = string
    color       = string
    description = string
  }))
  default = [
    { name = "bug", color = "d73a4a", description = "Something isn't working" },
    { name = "documentation", color = "0075ca", description = "Improvements or additions to documentation" },
    { name = "dependabot", color = "0052CC", description = "Updates by Dependabot" },
    { name = "duplicate", color = "cfd3d7", description = "This issue or pull request already exists" },
    { name = "enhancement", color = "a2eeef", description = "New feature or request" },
    { name = "help wanted", color = "008672", description = "Extra attention is needed" },
    { name = "question", color = "d876e3", description = "Further information is requested" },
    { name = "wontfix", color = "ffffff", description = "This will not be worked on" },
  ]
}
