# General Section

variable "env" {
  type        = string
  description = "Envinronment"
  default     = "nonprd"
}

variable "resource_group_name" {
  type        = string
  description = "PostgreSQL Resource Group Name"
}

variable "resource_group_location_master" {
  type        = string
  description = "PostgreSQL Resource Group Name"
  default     = "centralus"
}

variable "resource_group_location_replica" {
  type        = string
  description = "PostgreSQL Resource Group Location"
  default     = "eastus2"
}

variable "subscription_id" {
  description = "Define the subscription where the resources will be created"
  type        = string
}

variable "subscriptions_map" {
  type = map(string)
  default = {
    "d00c90f7-971e-4a72-8bf9-de4c6ff95671" = "INFRA-NONPROD"
    "1c0a5865-d68b-4eee-b776-f8dde703f98b" = "INFRA-PROD"
    "efcaa4e1-17a2-4fa8-8723-927f72b11559" = "CONTROLLERSHIP-NONPRD"
    "94a46c10-c399-4797-a00b-8b87e19fb793" = "CONTROLLERSHIP-PROD"
    "3b7d0560-3be1-45d8-87f2-f3ec96f3d153" = "FINANCIALPRODUCTS-NONPRD"
    "d2ac5dcc-a278-48dd-9d90-15ee38bcf70e" = "FINANCIALPRODUCTS-PROD"
    "9377aa5f-ff69-436a-979a-6c618433c76b" = "FRONT-NONPROD"
    "dcee3325-16e3-4df7-a58f-5320af5110dd" = "FRONT-PROD"
    "94fb9c31-5edb-4962-a079-12c96b9778a6" = "MUNDIPAGG-STAGING"
    "2db2a9d7-3409-4645-9a8d-11cee0563a42" = "MUNDIPAGG-PROD"
    "010993dc-1cb8-4fd3-bbfd-a632f0bd3d44" = "PROCESSOR-NONPRD"
    "0faa5afe-78ab-4609-b350-64b2ccc331f0" = "PROCESSOR-PROD"
    "44e27867-b317-4586-9fc1-a9a6aa112718" = "RISK-NONPROD"
    "e3f0e002-3e6e-4837-8653-00e41e041d3f" = "RISK-PROD"
    "4d10aa17-cb1c-4298-a84e-0312dc552136" = "TREASURY-NONPRD"
    "55662583-35a7-4535-902b-b7810b590b9c" = "TREASURY-PROD"
  }
}

variable "postgres_private_ip_master" {
  type = string
}

variable "postgres_private_ip_replica" {
  type = string
}

#############################################################################################################
# Main Instance Section
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
  default = {
    day_of_week  = 0 # Sunday
    start_hour   = 3 # 03:00
    start_minute = 0
  }
}

variable "tags" {
  description = "The tags to associate with your database."
  type        = map(string)
  default = {
    "cost-center" = " "
    "env"         = " "
    "project"     = " "
    "owner"       = " "
    "github-org"  = " "
    "github-repo" = " "
    "support"     = "foundation-platform-data-persistence"
  }
}

variable "enable_log_analytic_workspace_master" {
  type        = bool
  description = "Set to true to enable logs to be exported to Azure Analytic Workspace for this instance and remember to adjust the parameters for it on the monitoring section."
  default     = false
}

variable "enable_log_audit_storage_master" {
  type        = bool
  description = "Set to true to enable logs to be exported to Azure Storage Account for this instance and remember to adjust the parameters for it on the monitoring section."
  default     = false
}

variable "postgres_instance_server_configurations" {
  type = object({
    master = list(object({
      name  = string
      value = string
    }))
    replica = list(object({
      name  = string
      value = string
    }))
  })
  default = {
    master = [
      {
        name  = "log_statement"
        value = "all"
      },
      {
        name  = "log_checkpoints"
        value = "on"
      },
      {
        name  = "log_statement_stats"
        value = "on"
      },
      {
        name  = "log_line_prefix"
        value = "[%m] %u,%d,%c,|||"
      },
      {
        name  = "azure.extensions"
        value = "pgaudit,pg_stat_statements,pg_buffercache,pg_freespacemap,pg_repack,pageinspect,pg_visibility,pgstattuple,pg_prewarm"
      },
      {
        name  = "shared_preload_libraries"
        value = "pg_cron,pg_stat_statements,pgaudit"
      },
      {
        name  = "pgaudit.log"
        value = "all"
      },
      {
        name  = "pgaudit.log_catalog"
        value = "on"
      },
      {
        name  = "pgaudit.log_client"
        value = "on"
      },
      {
        name  = "pgaudit.log_level"
        value = "log"
      },
      {
        name  = "require_secure_transport"
        value = "off"
      },
      {
        name  = "pgbouncer.enabled"
        value = true
      }
    ]
    replica = [
      {
        name  = "log_statement"
        value = "all"
      },
      {
        name  = "log_checkpoints"
        value = "on"
      },
      {
        name  = "log_statement_stats"
        value = "on"
      },
      {
        name  = "log_line_prefix"
        value = "[%m] %u,%d,%c,|||"
      },
      {
        name  = "azure.extensions"
        value = "pgaudit,pg_stat_statements,pg_buffercache,pg_freespacemap,pageinspect,pg_visibility,pgstattuple"
      },
      {
        name  = "shared_preload_libraries"
        value = "pg_cron,pg_stat_statements,pgaudit"
      },
      {
        name  = "pgaudit.log"
        value = "all"
      },
      {
        name  = "pgaudit.log_catalog"
        value = "on"
      },
      {
        name  = "pgaudit.log_client"
        value = "on"
      },
      {
        name  = "pgaudit.log_level"
        value = "log"
      },
      {
        name  = "require_secure_transport"
        value = "off"
      },
      {
        name  = "pgbouncer.enabled"
        value = false
      }
    ]
  }
}

# Master and Replica Configurations and Firewall Section

variable "postgres_instance_server_firewall" {
  type = object({
    master = list(object({
      name             = string
      start_ip_address = string
      end_ip_address   = string
    }))
    replica = list(object({
      name             = string
      start_ip_address = string
      end_ip_address   = string
    }))
  })
  default = {
    master = [
      {
        name             = "JumpDBA-ATL-PUB"
        start_ip_address = "199.250.254.1"
        end_ip_address   = "199.250.254.254"
      },
      {
        name             = "JumpDBA-ATL-PRIV"
        start_ip_address = "10.99.6.31"
        end_ip_address   = "10.99.6.31"
      }
    ]
    replica = [
      {
        name             = "JumpDBA-ATL-PUB"
        start_ip_address = "199.250.254.1"
        end_ip_address   = "199.250.254.254"
      },
      {
        name             = "JumpDBA-ATL-PRIV"
        start_ip_address = "10.99.6.31"
        end_ip_address   = "10.99.6.31"
      }
    ]
  }
}

#############################################################################################################
# Read-Only Replica Section
variable "enable_replica_readonly" {
  type        = bool
  description = "Set to true to enable read-only replica, which can be created in a differente region to provide DR"
  default     = false
}

variable "postgres_instance_sku_name_replica" {
  type        = string
  description = "PostgreSQL SKU Name"
  default     = "GP_Standard_D2sds_v5"
}

variable "enable_log_analytic_workspace_replica" {
  type        = bool
  description = "Set to true to enable logs to be exported to Azure Analytic Workspace for this instance and remember to adjust the parameters for it on the monitoring section."
  default     = false
}

variable "enable_log_audit_storage_replica" {
  type        = bool
  description = "Set to true to enable logs to be exported to Azure Storage Account for this instance and remember to adjust the parameters for it on the monitoring section."
  default     = false
}

#############################################################################################################
# Monitoring Section
variable "postgres_instance_azurerm_log_analytics_workspace" {
  type = object({
    master = list(object({
      sku               = string
      retention_in_days = number
    }))
    replica = list(object({
      sku               = string
      retention_in_days = number
    }))
  })
  default = {
    master = [
      {
        sku               = "PerGB2018"
        retention_in_days = 30
      }
    ]
    replica = [
      {
        sku               = "PerGB2018"
        retention_in_days = 30
      }
    ]
  }
}

variable "postgres_instance_azurerm_storage_account" {
  type = object({
    master = list(object({
      account_tier             = string
      account_replication_type = string
      name                     = string
      account_kind             = string
    }))
    replica = list(object({
      account_tier             = string
      account_replication_type = string
      name                     = string
      account_kind             = string
    }))
  })
  default = {
    master = [
      {
        name                     = "nomesomentecomletrasenumeros"
        account_tier             = "Standard"
        account_replication_type = "RAGRS"
        account_kind             = "StorageV2"
      }
    ]
    replica = [
      {
        name                     = "nomesomentecomletrasenumeros"
        account_tier             = "Standard"
        account_replication_type = "RAGRS"
        account_kind             = "StorageV2"
      }
    ]
  }
}

variable "postgres_instance_logs_settings" {
  type = object({
    master = object({
      category_group = list(string)
      category       = string
    })
    replica = object({
      category_group = list(string)
      category       = string
    })
  })
  default = {
    master = {
      category_group = ["allLogs", "audit"]
      category       = "AllMetrics"
    }
    replica = {
      category_group = ["allLogs", "audit"]
      category       = "AllMetrics"
    }
  }
}

#############################################################################################################
# Database Section

variable "enable_postgres_module" {
  type    = bool
  default = true
}

variable "postgres_databases" {
  description = "A list of PostgreSQL database configurations."
  type = list(object({
    name      = string
    collation = string
    charset   = string
  }))
  default = [
    {
      name      = ""
      collation = "en_US.utf8"
      charset   = "utf8"
    }
  ]
}

variable "postgres_extensions" {
  type        = list(string)
  description = "List of extensions to be installed in the cluster and created in the database"
  default     = ["pgaudit", "pg_stat_statements", "pg_buffercache", "pg_freespacemap", "pageinspect", "pg_visibility", "pgstattuple"]
}

variable "postgresql_migration_user" {
  type        = string
  description = "User for the migration process"
  default     = "migrationappuser"
}

variable "postgresql_app_user" {
  type        = string
  description = "Application user"
  default     = "appuser"
}

variable "postgresql_datadog_user" {
  type        = string
  description = "Datadog integration user"
  default     = "datadog"
}

# Default Privileges for the appuser

variable "postgresql_table_default_privileges" {
  type        = list(string)
  description = "Default privileges to be applied on all tables for the appuser"
  default     = ["SELECT", "INSERT", "UPDATE", "DELETE"]
}

variable "postgresql_sequence_default_privileges" {
  type        = list(string)
  description = "Default privileges to be applied on all sequences for the appuser"
  default     = ["SELECT", "USAGE", "UPDATE"]
}

variable "postgresql_functions_default_privileges" {
  type        = list(string)
  description = "Default privileges to be applied on all funcions for the appuser"
  default     = ["EXECUTE"]
}

variable "postgresql_types_default_privileges" {
  type        = list(string)
  description = "Default privileges to be applied on all types for the appuser"
  default     = ["USAGE"]
}

#############################################################################################################
# Key Vault
variable "key-vault_name" {
  description = "keyvault name"
}

variable "key-vault_resource_group_name" {
  description = "Resource group name"
}

variable "key-vault_resouce_group_location" {
  description = "Resource group location"
}

variable "key_vault_tags" {
  description = "List of tags"
}
