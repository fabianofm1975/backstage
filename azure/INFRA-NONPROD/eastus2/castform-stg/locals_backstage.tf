locals {
  backstage = {
      env             = "stg"
      subscription_name = "INFRA-NONPROD"
      resource_group_name            = "castform-stg"
      resource_group_location = "eastus2"
      postgres_instance_name                         = "castform"
      postgres_instance_version                      = 14
      postgres_instance_storage_mb                   = 32768
      postgres_instance_sku_name                     = "B_Standard_B1ms"
      enable_replica_readonly               = "true" == "true" ? true : false
      postgres_replica_sku_name = "B_Standard_B1ms"

      tags = {
        "env"         =  "stg" == "stg" ? "staging" : "prd" == "sdx" ? "sandbox" : "production" 
        "cost-center" = "860290034"
        "project"     = "castform"
        "owner"       = "group:default/team-c"
      }

     app_user = "castform"
  }
}
