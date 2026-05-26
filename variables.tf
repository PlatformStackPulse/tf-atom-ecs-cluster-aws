variable "container_insights_enabled" {
  description = "Enable CloudWatch Container Insights"
  type        = bool
  default     = true
}

variable "execute_command_logging" {
  description = "Execute command logging mode (NONE, DEFAULT, OVERRIDE)"
  type        = string
  default     = "DEFAULT"
  validation {
    condition     = contains(["NONE", "DEFAULT", "OVERRIDE"], var.execute_command_logging)
    error_message = "execute_command_logging must be NONE, DEFAULT, or OVERRIDE."
  }
}
