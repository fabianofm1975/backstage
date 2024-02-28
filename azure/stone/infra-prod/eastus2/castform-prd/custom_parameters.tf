locals {
  custom = {
    postgres_instance_backup_retention_days        = 35
    postgres_instance_geo_redundant_backup_enabled = true
    postgres_instance_maintenance_window = {
      day_of_week  = 0 # Sunday
      start_hour   = 3 # 03:00
      start_minute = 0
    }

    enable_log_analytic_workspace            = false
    enable_log_audit_storage                 = false
    enable_instance_high_availability        = false
    postgres_instance_high_availability_mode = "ZoneRedundant"

    postgres_instance_azurerm_log_analytics_workspace = {
      sku               = "PerGB2018"
      retention_in_days = 30
    }

    postgres_instance_azurerm_storage_account = {
      name                     = substr("${local.backstage.postgres_instance_name}${local.backstage.env}", 0, 23)
      account_tier             = "Standard"
      account_replication_type = "RAGRS"
      account_kind             = "StorageV2"
    }

    postgres_instance_logs_settings = {
      category_group = ["allLogs", "audit"]
      category       = "AllMetrics"
    }

    postgres_instance_server_configurations = [
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
        name  = "azure.extensions",
        value = "pgaudit,pg_stat_statements,pg_buffercache,pg_freespacemap,pg_repack,pageinspect,pg_visibility,pgstattuple,pg_prewarm,pg_cron"
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
      }
    ]
  }
}
