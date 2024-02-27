# Module declaration

locals {
  subscription_id = local.subscription.subscriptions_map[local.backstage.subscription_name]
}

module "postgres-azure" {
  source = "git@github.com:stone-payments/data-persistence-terraform-modules.git//modules/azure-postgresql-flexible-backstage"

  # Server Instance Section
  env                          = local.backstage.env
  subscription_id              = local.subscription_id
  resource_group_name          = local.backstage.resource_group_name
  resource_group_location      = local.backstage.resource_group_location
  postgres_instance_name       = local.backstage.postgres_instance_name
  postgres_instance_version    = local.backstage.postgres_instance_version
  postgres_instance_storage_mb = local.backstage.postgres_instance_storage_mb
  postgres_instance_sku_name   = local.backstage.postgres_instance_sku_name
  tags                         = local.backstage.tags

  # Network Settings
  postgres_instance_server_firewall = local.firewall.postgres_instance_server_firewall

  # Instance Configuration Section
  postgres_instance_server_configurations = local.custom.postgres_instance_server_configurations
  postgres_instance_maintenance_window    = local.custom.postgres_instance_maintenance_window

  # Backup Section
  postgres_instance_backup_retention_days        = local.custom.postgres_instance_backup_retention_days
  postgres_instance_geo_redundant_backup_enabled = local.custom.postgres_instance_geo_redundant_backup_enabled

  # Observability Section
  enable_log_analytic_workspace                     = local.custom.enable_log_analytic_workspace
  enable_log_audit_storage                          = local.custom.enable_log_audit_storage
  postgres_instance_azurerm_log_analytics_workspace = local.custom.postgres_instance_azurerm_log_analytics_workspace
  postgres_instance_azurerm_storage_account         = local.custom.postgres_instance_azurerm_storage_account
  postgres_instance_logs_settings                   = local.custom.postgres_instance_logs_settings

  # Replication (DR) and HA Section
  enable_replica_readonly                  = local.backstage.enable_replica_readonly
  postgres_replica_sku_name                = local.backstage.postgres_replica_sku_name
  enable_instance_high_availability        = local.custom.enable_instance_high_availability
  postgres_instance_high_availability_mode = local.custom.postgres_instance_high_availability_mode

}
