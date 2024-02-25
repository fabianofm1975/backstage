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
      enable_replica_readonly               = postgres_replica_type == "true" ? true : false
      postgres_replica_sku_name = ""

      tags = {
        "env"         =  "stg" == "stg" ? "staging" : "prd" == "sdx" ? "sandbox" : "production" 
        "cost-center" = "800050020"
        "project"     = "castform"
        "owner"       = "group:default/team-b"
      }

     app_user = "castform"
  }
}
