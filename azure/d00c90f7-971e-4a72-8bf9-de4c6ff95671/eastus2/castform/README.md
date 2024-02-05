# AzureRM PostgreSQL Terrafom module

This module creates an Azure PostgreSQL infrastructure following the best practices defined by the SRE/Cloud team at Stone CO.

## Requirements...

| Name      | Version   |
|-----------|-----------|
| terraform | >= 1.5.5  |
| azurerm   | ~> 3.72.0 |

## How to use

```hcl

module "postgres-azure" {
	source = "git@github.com:stone-payments/infra-cloud-psql.git//modules/azure" 

# Resource Group Section

azurerm_resource_group_name               =   "..."
azurerm_resource_group_location           =   "..."

# Server Section

postgres_instance_name                    =   "..."
postgres_instance_version                 =   "..."
postgres_instance_administrator_login     =   "..."
postgres_instance_administrator_password  =   "..."
postgres_instance_zone                    =   "..."
postgres_instance_storage_mb              =   "..."
postgres_instance_sku_name                =   "..."
postgres_instance_backup_retention_days   =   "..."
postgres_instance_extensions              =   "..."

# Database section

postgres_database_name                    =   "..."
postgres_database_collation               =   "..."
postgres_database_charset                 =   "..."

}

## Ambiente do banco de dados:
[Produção](https://mundipagg.atlassian.net/wiki/spaces/SDB/pages/6097014471/Azure+Postgresql+Production+Environments)

[Staging](https://mundipagg.atlassian.net/wiki/spaces/SDB/pages/6235166982/Azure+PostgreSQL+-+Staging)