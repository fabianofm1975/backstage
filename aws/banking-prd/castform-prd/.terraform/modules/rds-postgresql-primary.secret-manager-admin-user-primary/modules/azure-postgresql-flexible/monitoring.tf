# Analytic Workspace Section - Master

resource "azurerm_log_analytics_workspace" "analytic_logs_master" {
  count               = var.enable_log_analytic_workspace_master ? 1 : 0
  name                = "${var.postgres_instance_name}-workspace"
  tags                = var.tags
  resource_group_name = azurerm_resource_group.default.name
  location            = azurerm_resource_group.default.location
  sku                 = var.postgres_instance_azurerm_log_analytics_workspace["master"][count.index].sku
  retention_in_days   = var.postgres_instance_azurerm_log_analytics_workspace["master"][count.index].retention_in_days
  depends_on          = [azurerm_postgresql_flexible_server.master]
}

# Storage Account for Log Audit Section - Master

resource "azurerm_storage_account" "audit_logs_master" {
  count                    = var.enable_log_audit_storage_master ? 1 : 0
  name                     = "${var.postgres_instance_azurerm_storage_account["master"][count.index].name}audit"
  tags                     = var.tags
  resource_group_name      = azurerm_resource_group.default.name
  location                 = azurerm_resource_group.default.location
  account_tier             = var.postgres_instance_azurerm_storage_account["master"][count.index].account_tier
  account_replication_type = var.postgres_instance_azurerm_storage_account["master"][count.index].account_replication_type
  account_kind             = var.postgres_instance_azurerm_storage_account["master"][count.index].account_kind
  depends_on               = [azurerm_postgresql_flexible_server.master]
}

#############################################################################################################

# Analytic Workspace Section - Replica

resource "azurerm_log_analytics_workspace" "analytic_logs_replica" {
  count               = var.enable_replica_readonly && var.enable_log_analytic_workspace_replica ? 1 : 0
  name                = "${var.postgres_instance_name}-workspace-rpl"
  tags                = var.tags
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location_replica
  sku                 = var.postgres_instance_azurerm_log_analytics_workspace["replica"][count.index].sku
  retention_in_days   = var.postgres_instance_azurerm_log_analytics_workspace["replica"][count.index].retention_in_days
  depends_on          = [azurerm_postgresql_flexible_server.replica]
}

# Storage Account for Log Audit Section - Replica

resource "azurerm_storage_account" "audit_logs_replica" {
  count                    = var.enable_replica_readonly && var.enable_log_audit_storage_replica ? 1 : 0
  name                     = var.postgres_instance_azurerm_storage_account["replica"][count.index].name
  tags                     = var.tags
  resource_group_name      = var.resource_group_name
  location                 = var.resource_group_location_replica
  account_tier             = var.postgres_instance_azurerm_storage_account["replica"][count.index].account_tier
  account_replication_type = var.postgres_instance_azurerm_storage_account["replica"][count.index].account_replication_type
  account_kind             = var.postgres_instance_azurerm_storage_account["replica"][count.index].account_kind
  depends_on               = [azurerm_postgresql_flexible_server.replica]
}
