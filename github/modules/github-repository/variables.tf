variable "name" {
  type        = string
  description = "The name of the repository"
}

variable "description" {
  type        = string
  default     = null
  description = "A description of the repository"
}

variable "homepage_url" {
  type        = string
  default     = null
  description = "URL which describes the repository"
}

variable "visibility" {
  type    = string
  default = "public"
  validation {
    condition     = contains(["public", "private"], var.visibility)
    error_message = "Allowed values for visibility are \"public\" or \"private\"."
  }
  description = "A visibility of the repository"
}

variable "has_issues" {
  type        = bool
  default     = true
  description = "Whether having issues"
}

variable "has_discussions" {
  type        = bool
  default     = false
  description = "Whether having discussions"
}

variable "is_template" {
  type        = bool
  default     = false
  description = "Whether is a template repository"
}

variable "archived" {
  type        = bool
  default     = false
  description = "Whether is archived"
}

variable "topics" {
  type        = list(string)
  default     = []
  description = "The list of topics of the repository"
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
  default     = []
  description = "GitHub repository branch configurations"
}

variable "collaborators" {
  type = list(object({
    permission = string
    team_id    = string
  }))
  default     = []
  description = "GitHub repository collaborators configurations (only team supported)"
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
  description = "GitHub repository issue labels configurations"
}

variable "secrets" {
  type = list(object({
    name  = string
    value = string
  }))
  default     = []
  description = "GitHub repository branch configurations"
}
