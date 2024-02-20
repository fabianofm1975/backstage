# Module declaration
module "postgres-azure" {
  source = "git@github.com:stone-payments/data-persistence-terraform-modules.git//modules/azure-postgresql-flexible"

  # Server Instance Section
  env                            = local.env
  subscription_id                = local.subscription_id
  resource_group_name            = local.resource_group_name
  resource_group_location_master = local.resource_group_location_master
  postgres_instance_name         = "${local.postgres_instance_name}-${local.env}"
  postgres_instance_version      = local.postgres_instance_version
  postgres_instance_storage_mb   = local.postgres_instance_storage_mb
  postgres_instance_sku_name     = local.postgres_instance_sku_name
  tags                           = local.tags

  # Network Settings
  postgres_instance_server_firewall = local.postgres_instance_server_firewall
  postgres_private_ip_master        = local.postgres_private_ip_master

  # Instance Configuration Section
  postgres_instance_server_configurations = local.postgres_instance_server_configurations
  postgres_instance_maintenance_window    = local.postgres_instance_maintenance_window

  # Backup Section
  postgres_instance_backup_retention_days        = local.postgres_instance_backup_retention_days
  postgres_instance_geo_redundant_backup_enabled = local.postgres_instance_geo_redundant_backup_enabled

  # Observability Section
  enable_log_analytic_workspace_master              = local.enable_log_analytic_workspace_master
  enable_log_audit_storage_master                   = local.enable_log_audit_storage_master
  postgres_instance_azurerm_log_analytics_workspace = local.postgres_instance_azurerm_log_analytics_workspace
  postgres_instance_azurerm_storage_account         = local.postgres_instance_azurerm_storage_account
  postgres_instance_logs_settings                   = local.postgres_instance_logs_settings

  # Replication (DR) and HA Section
  enable_replica_readonly                  = local.enable_replica_readonly
  enable_log_analytic_workspace_replica    = local.enable_log_analytic_workspace_replica
  enable_log_audit_storage_replica         = local.enable_log_audit_storage_replica
  resource_group_location_replica          = local.resource_group_location_replica
  postgres_instance_sku_name_replica       = local.postgres_instance_sku_name_replica
  enable_instance_high_availability        = local.enable_instance_high_availability
  postgres_instance_high_availability_mode = local.postgres_instance_high_availability_mode
  postgres_private_ip_replica              = local.postgres_private_ip_replica

  # Key-Vault
  key-vault_resource_group_name    = local.resource_group_name
  key-vault_name                   = "${local.postgres_instance_name}-${local.env}"
  key-vault_resouce_group_location = local.resource_group_location_master
  key_vault_tags                   = local.tags

  # Database Section
  enable_postgres_module                  = local.enable_postgres_module
  postgres_databases                      = local.postgres_databases
  postgresql_app_user                     = local.postgresql_app_user
  postgresql_table_default_privileges     = local.postgresql_table_default_privileges
  postgresql_sequence_default_privileges  = local.postgresql_sequence_default_privileges
  postgresql_functions_default_privileges = local.postgresql_functions_default_privileges
  postgresql_types_default_privileges     = local.postgresql_types_default_privileges
}
