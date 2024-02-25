locals {
  backstage = {
      env             = "stg"
      subscription_name = "infra-nonprod"
      resource_group_name            = "castform-stg"
      resource_group_location = "eastus2"
      postgres_instance_name                         = "castform-stg-db"
      postgres_instance_version                      = 14
      postgres_instance_storage_mb                   = 32768
      postgres_instance_sku_name                     = "B_Standard_B1ms"
      enable_replica_readonly               = "" == "true" ? true : false

      tags = {
        "env"         =  "stg" == "stg" ? "staging" : "stg" == "sdx" ? "sandbox" : "production" 
        "cost-center" = "860290033"
        "project"     = "castform"
        "owner"       = "group:default/infrastructure"
      }
  }
}
