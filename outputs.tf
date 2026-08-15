output "config_remediation_configurations_id" {
  description = "Map of id values across all config_remediation_configurations, keyed the same as var.config_remediation_configurations"
  value       = { for k, v in aws_config_remediation_configuration.config_remediation_configurations : k => v.id if v.id != null && length(v.id) > 0 }
}
output "config_remediation_configurations_arn" {
  description = "Map of arn values across all config_remediation_configurations, keyed the same as var.config_remediation_configurations"
  value       = { for k, v in aws_config_remediation_configuration.config_remediation_configurations : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "config_remediation_configurations_automatic" {
  description = "Map of automatic values across all config_remediation_configurations, keyed the same as var.config_remediation_configurations"
  value       = { for k, v in aws_config_remediation_configuration.config_remediation_configurations : k => v.automatic if v.automatic != null }
}
output "config_remediation_configurations_config_rule_name" {
  description = "Map of config_rule_name values across all config_remediation_configurations, keyed the same as var.config_remediation_configurations"
  value       = { for k, v in aws_config_remediation_configuration.config_remediation_configurations : k => v.config_rule_name if v.config_rule_name != null && length(v.config_rule_name) > 0 }
}
output "config_remediation_configurations_execution_controls" {
  description = "Map of execution_controls values across all config_remediation_configurations, keyed the same as var.config_remediation_configurations"
  value       = { for k, v in aws_config_remediation_configuration.config_remediation_configurations : k => one(v.execution_controls) if v.execution_controls != null && length(v.execution_controls) > 0 }
}
output "config_remediation_configurations_maximum_automatic_attempts" {
  description = "Map of maximum_automatic_attempts values across all config_remediation_configurations, keyed the same as var.config_remediation_configurations"
  value       = { for k, v in aws_config_remediation_configuration.config_remediation_configurations : k => v.maximum_automatic_attempts if v.maximum_automatic_attempts != null }
}
output "config_remediation_configurations_parameter" {
  description = "Map of parameter values across all config_remediation_configurations, keyed the same as var.config_remediation_configurations"
  value       = { for k, v in aws_config_remediation_configuration.config_remediation_configurations : k => v.parameter if v.parameter != null && length(v.parameter) > 0 }
}
output "config_remediation_configurations_region" {
  description = "Map of region values across all config_remediation_configurations, keyed the same as var.config_remediation_configurations"
  value       = { for k, v in aws_config_remediation_configuration.config_remediation_configurations : k => v.region if v.region != null && length(v.region) > 0 }
}
output "config_remediation_configurations_resource_type" {
  description = "Map of resource_type values across all config_remediation_configurations, keyed the same as var.config_remediation_configurations"
  value       = { for k, v in aws_config_remediation_configuration.config_remediation_configurations : k => v.resource_type if v.resource_type != null && length(v.resource_type) > 0 }
}
output "config_remediation_configurations_retry_attempt_seconds" {
  description = "Map of retry_attempt_seconds values across all config_remediation_configurations, keyed the same as var.config_remediation_configurations"
  value       = { for k, v in aws_config_remediation_configuration.config_remediation_configurations : k => v.retry_attempt_seconds if v.retry_attempt_seconds != null }
}
output "config_remediation_configurations_target_id" {
  description = "Map of target_id values across all config_remediation_configurations, keyed the same as var.config_remediation_configurations"
  value       = { for k, v in aws_config_remediation_configuration.config_remediation_configurations : k => v.target_id if v.target_id != null && length(v.target_id) > 0 }
}
output "config_remediation_configurations_target_type" {
  description = "Map of target_type values across all config_remediation_configurations, keyed the same as var.config_remediation_configurations"
  value       = { for k, v in aws_config_remediation_configuration.config_remediation_configurations : k => v.target_type if v.target_type != null && length(v.target_type) > 0 }
}
output "config_remediation_configurations_target_version" {
  description = "Map of target_version values across all config_remediation_configurations, keyed the same as var.config_remediation_configurations"
  value       = { for k, v in aws_config_remediation_configuration.config_remediation_configurations : k => v.target_version if v.target_version != null && length(v.target_version) > 0 }
}

