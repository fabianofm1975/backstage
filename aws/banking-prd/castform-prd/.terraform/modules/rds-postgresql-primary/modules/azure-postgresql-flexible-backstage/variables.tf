variable "env" {
  type        = string
  description = "Envinronment"
  default     = "nonprd"
}

variable "resource_group_name" {
  type        = string
  description = "PostgreSQL Resource Group Name"
}

variable "resource_group_location" {
  type        = string
  description = "PostgreSQL Resource Group Name"
  default     = "centralus"
}

variable "subscription_id" {
  description = "Define the subscription where the resources will be created"
  type        = string
}

variable "subscriptions_map" {
  type = map(string)
  default = {
    "d00c90f7-971e-4a72-8bf9-de4c6ff95671" = "infra-nonprod"
    "1c0a5865-d68b-4eee-b776-f8dde703f98b" = "infra-prod"
    "efcaa4e1-17a2-4fa8-8723-927f72b11559" = "controllership-nonprd"
    "94a46c10-c399-4797-a00b-8b87e19fb793" = "controllership-prod"
    "3b7d0560-3be1-45d8-87f2-f3ec96f3d153" = "financialproducts-nonprd"
    "d2ac5dcc-a278-48dd-9d90-15ee38bcf70e" = "financialproducts-prod"
    "9377aa5f-ff69-436a-979a-6c618433c76b" = "front-nonprod"
    "dcee3325-16e3-4df7-a58f-5320af5110dd" = "front-prod"
    "94fb9c31-5edb-4962-a079-12c96b9778a6" = "mundipagg-staging"
    "2db2a9d7-3409-4645-9a8d-11cee0563a42" = "mundipagg-prod"
    "010993dc-1cb8-4fd3-bbfd-a632f0bd3d44" = "processor-nonprd"
    "0faa5afe-78ab-4609-b350-64b2ccc331f0" = "processor-prod"
    "44e27867-b317-4586-9fc1-a9a6aa112718" = "risk-nonprod"
    "e3f0e002-3e6e-4837-8653-00e41e041d3f" = "risk-prod"
    "4d10aa17-cb1c-4298-a84e-0312dc552136" = "treasury-nonprd"
    "55662583-35a7-4535-902b-b7810b590b9c" = "treasury-prod"
  }
}

variable "postgres_instance_name" {
  type        = string
  description = "PostgreSQL Instance Name"
}

variable "postgres_instance_version" {
  type        = number
  description = "PostgreSQL Version"
  default     = 15
}

variable "postgres_instance_administrator_login" {
  type        = string
  description = "PostgreSQL Administrator Login"
  default     = "postgres"
}

variable "postgres_instance_storage_mb" {
  type        = number
  description = "PostgreSQL Instance Storage Size"
  default     = 32768
}

variable "postgres_instance_sku_name" {
  type        = string
  description = "PostgreSQL SKU Name"
  default     = "GP_Standard_D2s_v3"
}

variable "postgres_instance_backup_retention_days" {
  type        = number
  description = "PostgreSQL Backup Retention"
  default     = 35
}

variable "postgres_instance_geo_redundant_backup_enabled" {
  type        = bool
  description = "Set to true to enable backup to be replicated to another location"
  default     = false
}

variable "enable_instance_high_availability" {
  description = "Enable High Availabilty"
  type        = bool
  default     = false
}

variable "postgres_instance_high_availability_mode" {
  description = "Enable with ZoneReduntant, disable with SameZone (Check if the Region where you are creating the resource has more than one Zone)"
  type        = string
  default     = "SameZone"
}

variable "postgres_instance_maintenance_window" {
  description = "Maintenance window configuration for the PostgreSQL flexible server."
  type = object({
    day_of_week  = number
    start_hour   = number
    start_minute = number
  })
}

variable "tags" {
  description = "The tags to associate with your database."
  type        = map(string)
  default = {
    "cost-center" = " "
    "env"         = " "
    "project"     = " "
    "owner"       = " "
    "github-org"  = "stone-payments"
    "github-repo" = "data-persistence-terraform-deploys"
    "support"     = "fp-persistenciadados"
  }
}

variable "enable_log_analytic_workspace" {
  type        = bool
  description = "Set to true to enable logs to be exported to Azure Analytic Workspace for this instance and remember to adjust the parameters for it on the monitoring section."
  default     = false
}

variable "enable_log_audit_storage" {
  type        = bool
  description = "Set to true to enable logs to be exported to Azure Storage Account for this instance and remember to adjust the parameters for it on the monitoring section."
  default     = false
}

variable "postgres_instance_server_configurations" {
  type = list(object({
    name  = string
    value = string
  }))
}

variable "postgres_instance_server_firewall" {
  type = list(object({
    name             = string
    start_ip_address = string
    end_ip_address   = string
  }))
}

variable "enable_replica_readonly" {
  type        = bool
  description = "Set to true to enable read-only replica, which can be created in a differente region to provide DR"
  default     = false
}

variable "postgres_replica_sku_name" {
  type        = string
  description = "PostgreSQL SKU Name"
}

variable "postgres_instance_azurerm_log_analytics_workspace" {
  type = object({
    sku               = string
    retention_in_days = number
  })
}

variable "postgres_instance_azurerm_storage_account" {
  type = object({
    account_tier             = string
    account_replication_type = string
    name                     = string
    account_kind             = string
  })
}

variable "postgres_instance_logs_settings" {
  type = object({
    category_group = list(string)
    category       = string
  })
}

