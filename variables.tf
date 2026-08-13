variable "config_remediation_configurations" {
  description = <<EOT
Map of config_remediation_configurations, attributes below
Required:
    - config_rule_name
    - target_id
    - target_type
Optional:
    - automatic
    - maximum_automatic_attempts
    - region
    - resource_type
    - retry_attempt_seconds
    - target_version
    - execution_controls (block):
        - ssm_controls (optional, block):
            - concurrent_execution_rate_percentage (optional)
            - error_percentage (optional)
    - parameter (block):
        - name (required)
        - resource_value (optional)
        - static_value (optional)
        - static_values (optional)
EOT

  type = map(object({
    config_rule_name           = string
    target_id                  = string
    target_type                = string
    automatic                  = optional(bool)
    maximum_automatic_attempts = optional(number)
    region                     = optional(string)
    resource_type              = optional(string)
    retry_attempt_seconds      = optional(number)
    target_version             = optional(string)
    execution_controls = optional(object({
      ssm_controls = optional(object({
        concurrent_execution_rate_percentage = optional(number)
        error_percentage                     = optional(number)
      }))
    }))
    parameter = optional(list(object({
      name           = string
      resource_value = optional(string)
      static_value   = optional(string)
      static_values  = optional(list(string))
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.config_remediation_configurations : (
        v.parameter == null || (length(v.parameter) <= 25)
      )
    ])
    error_message = "Each parameter list must contain at most 25 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.config_remediation_configurations : (
        length(v.config_rule_name) >= 1 && length(v.config_rule_name) <= 64
      )
    ])
    error_message = "must be between 1 and 64 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.config_remediation_configurations : (
        v.execution_controls == null || (v.execution_controls.ssm_controls == null || (v.execution_controls.ssm_controls.concurrent_execution_rate_percentage == null || (v.execution_controls.ssm_controls.concurrent_execution_rate_percentage >= 1 && v.execution_controls.ssm_controls.concurrent_execution_rate_percentage <= 100)))
      )
    ])
    error_message = "must be between 1 and 100"
  }
  validation {
    condition = alltrue([
      for k, v in var.config_remediation_configurations : (
        v.execution_controls == null || (v.execution_controls.ssm_controls == null || (v.execution_controls.ssm_controls.error_percentage == null || (v.execution_controls.ssm_controls.error_percentage >= 1 && v.execution_controls.ssm_controls.error_percentage <= 100)))
      )
    ])
    error_message = "must be between 1 and 100"
  }
  validation {
    condition = alltrue([
      for k, v in var.config_remediation_configurations : (
        v.maximum_automatic_attempts == null || (v.maximum_automatic_attempts >= 1 && v.maximum_automatic_attempts <= 25)
      )
    ])
    error_message = "must be between 1 and 25"
  }
  validation {
    condition = alltrue([
      for k, v in var.config_remediation_configurations : (
        v.retry_attempt_seconds == null || (v.retry_attempt_seconds >= 1 && v.retry_attempt_seconds <= 2678000)
      )
    ])
    error_message = "must be between 1 and 2678000"
  }
  validation {
    condition = alltrue([
      for k, v in var.config_remediation_configurations : (
        length(v.target_id) >= 1 && length(v.target_id) <= 256
      )
    ])
    error_message = "must be between 1 and 256 characters"
  }
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

