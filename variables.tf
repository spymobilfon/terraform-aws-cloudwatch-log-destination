variable "services" {
  description = "List of services for logging."
  default     = []
  type        = list(string)
}

variable "central_storage_region" {
  description = "AWS region where located central storage for logging or central endpoint for logging."
  default     = "eu-central-1"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default     = {}
}
