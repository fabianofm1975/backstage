#  Main Section

locals {
  # Define the subscription where the resources will be created
  env             = "prd"
  subscription_id = "INFRA-PROD"

  # Resource Group Section
  resource_group_name            = "greenforce-manager-prd"
  resource_group_location_master = "eastus2"

  # Instance Section
  postgres_instance_name                         = "greenforce-manager-db"
  postgres_instance_version                      = 15
  postgres_instance_storage_mb                   = 32768
  postgres_instance_sku_name                     = "GP_Standard_D2s_v3"
  postgres_instance_backup_retention_days        = 35
  postgres_instance_geo_redundant_backup_enabled = true
  postgres_private_ip_master                     = "10.150.139.4"
  postgres_instance_maintenance_window = {
    day_of_week  = 0 # Sunday
    start_hour   = 3 # 03:00
    start_minute = 0
  }

  tags = {
    "env"         =  "prd" == "stg" ? "staging" : "prd" == "sdx" ? "sandbox" : "production"
    "cost-center" = "810120020"
    "project"     = "greenforce-manager"
    "owner"       = "group:default/guests"
  }

  enable_log_analytic_workspace_master = false
  enable_log_audit_storage_master      = false

  # HA Section
  # Enable with ZoneRedundant, disable with SameZone (Check if the Region where you are creating the resource has more than one Zone)
  enable_instance_high_availability = false

  # Only applies if enable_instance_high_availability is truename
  postgres_instance_high_availability_mode = "ZoneRedundant"

  # Read-Only Replica Section (DR)
  enable_replica_readonly               = "true" == "true" ? true : false
  resource_group_location_replica       = "eastus2" == "eastus2" ? "centralus" : "eastus2"
  postgres_instance_sku_name_replica    = "GP_Standard_D2s_v3"
  enable_log_analytic_workspace_replica =  false
  enable_log_audit_storage_replica      = false
  postgres_private_ip_replica           = "10.151.139.4"

  # Logs Section
  postgres_instance_azurerm_log_analytics_workspace = {
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

  postgres_instance_azurerm_storage_account = {
    master = [
      {
        name                     = substr(replace("${local.postgres_instance_name}${local.env}", "-", ""), 0, 23)
        account_tier             = "Standard"
        account_replication_type = "RAGRS"
        account_kind             = "StorageV2"
      }
    ]
    replica = [
      {
        name                     = substr(replace("${local.postgres_instance_name}${local.env}", "-", ""), 0, 23)
        account_tier             = "Standard"
        account_replication_type = "RAGRS"
        account_kind             = "StorageV2"
      }
    ]
  }

  postgres_instance_logs_settings = {
    master = {
      category_group = ["allLogs", "audit"]
      category       = "AllMetrics"
    }
    replica = {
      category_group = ["allLogs", "audit"]
      category       = "AllMetrics"
    }
  }

  # Instance Configuration section
  postgres_instance_server_configurations = {
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
        name  = "azure.extensions",
        value = "pgaudit,pg_stat_statements,pg_buffercache,pg_freespacemap,pageinspect,pg_visibility,pgstattuple,pg_prewarm,pg_cron"
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

  # Firewall and Access Section
  postgres_instance_server_firewall = {
    master = [
      {
        name             = "Atlantis_1"
        start_ip_address = "44.206.79.98"
        end_ip_address   = "44.206.79.98"
      },
      {
        name             = "Atlantis_2"
        start_ip_address = "52.70.24.181"
        end_ip_address   = "52.70.24.181"
      },
      {
        name             = "Atlantis_3"
        start_ip_address = "54.196.242.191"
        end_ip_address   = "54.196.242.191"
      },
      {
        name             = "Atlantis_4"
        start_ip_address = "44.196.181.193"
        end_ip_address   = "44.196.181.193"
      },
      {
        name             = "JumpDBA-ATL-PRIV"
        start_ip_address = "10.99.6.31"
        end_ip_address   = "10.99.6.31"
      },
      {
        name             = "Karavelas-PRD"
        start_ip_address = "10.150.140.1"
        end_ip_address   = "10.150.141.254"
      },
      {
        name             = "Karavelas-DR"
        start_ip_address = "10.151.140.1"
        end_ip_address   = "10.151.141.254"
      },
      {
        name             = "Github_Actions_Runner_1"
        start_ip_address = "10.10.3.103"
        end_ip_address   = "10.10.3.103"
      },
      {
        name             = "Github_Actions_Runner_2"
        start_ip_address = "10.100.32.152"
        end_ip_address   = "10.100.32.152"
      },
      {
        name             = "Github_Actions_Runner_3"
        start_ip_address = "10.104.4.172"
        end_ip_address   = "10.104.4.172"
      },
      {
        name             = "allow_GSN_1"
        start_ip_address = "10.171.36.1"
        end_ip_address   = "10.171.39.254"
      },
      {
        name             = "allow_GSN_2"
        start_ip_address = "10.171.32.1"
        end_ip_address   = "10.171.35.254"
      },
      {
        name             = "allow_GSN_3"
        start_ip_address = "10.171.40.1"
        end_ip_address   = "10.171.43.254"
      }
    ]
    replica = [
      {
        name             = "JumpDBA-ATL-PRIV"
        start_ip_address = "10.99.6.31"
        end_ip_address   = "10.99.6.31"
      }
    ]
  }

  # Database section
  enable_postgres_module = true

  postgres_databases = [
    {
      name      = "greenforce-manager-db"
      collation = "en_US.utf8"
      charset   = "utf8"
    }
  ]

  postgres_extensions = ["pgaudit", "pg_stat_statements", "pg_buffercache", "pg_freespacemap", "pageinspect", "pg_visibility", "pgstattuple", "pg_cron"]

  # App Users and Privileges section
  postgresql_app_user = "greenforce-managerappuser"

  # Default Privileges for the appuser
  postgresql_table_default_privileges     = ["SELECT", "INSERT", "UPDATE", "DELETE"]
  postgresql_sequence_default_privileges  = ["SELECT", "USAGE", "UPDATE"]
  postgresql_functions_default_privileges = ["EXECUTE"]
  postgresql_types_default_privileges     = ["USAGE"]
}

