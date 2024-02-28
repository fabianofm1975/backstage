# Key-Vault Settings

data "azurerm_client_config" "current" {}

resource "random_password" "AppUserPassword" {
  length  = 20
  special = false
}

resource "random_password" "MigrationAppUserPassword" {
  length  = 20
  special = false
}

resource "random_password" "DatadogPassword" {
  length  = 20
  special = false
}

resource "random_password" "AdminUserPassword" {
  length  = 20
  special = false
}

locals {
  secrets_list = {
    "${var.postgres_instance_administrator_login}" = {
      secret_value = random_password.AdminUserPassword.result
    },
    "${var.postgresql_app_user}" = {
      secret_value = random_password.AppUserPassword.result
    },
    "${var.postgresql_migration_user}" = {
      secret_value = random_password.MigrationAppUserPassword.result
    },
    "${var.postgresql_datadog_user}" = {
      secret_value = random_password.DatadogPassword.result
    }
  }
}

resource "azurerm_key_vault" "default" {
  name                          = var.key-vault_name
  resource_group_name           = var.resource_group_name
  location                      = var.resource_group_location_master
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days    = 90
  sku_name                      = "standard"
  public_network_access_enabled = true
  tags                          = var.tags
  depends_on                    = [azurerm_resource_group.default]
}

resource "azurerm_key_vault_access_policy" "dbre" {
  key_vault_id = azurerm_key_vault.default.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = "cc147e7e-8d74-4ab5-9e02-85fa7f0b62eb"
  secret_permissions = [
  "Get", "List", "Set", "Delete", "Recover", "Backup", "Restore", "Purge"]
  depends_on = [azurerm_key_vault.default]
}

resource "azurerm_key_vault_access_policy" "atlantis" {
  key_vault_id = azurerm_key_vault.default.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id
  secret_permissions = [
    "Get", "List", "Set", "Delete", "Recover", "Backup", "Restore", "Purge"
  ]
  depends_on = [azurerm_key_vault.default]
}

resource "azurerm_key_vault_secret" "secrets" {
  for_each        = local.secrets_list
  name            = each.key
  value           = each.value.secret_value
  key_vault_id    = azurerm_key_vault.default.id
  content_type    = "text/plain"
  expiration_date = "2035-12-31T00:00:00Z"
  depends_on      = [azurerm_key_vault.default, azurerm_key_vault_access_policy.atlantis, azurerm_key_vault_access_policy.dbre]
}
