locals {
  backstage = {
      env             = "prd"
      subscription_name = "infra-prod"
      resource_group_name            = "castform-prd"
      resource_group_location = "eastus2"
      postgres_instance_name                         = "castform-prd"
      postgres_instance_version                      = 14
      postgres_instance_storage_mb                   = 32768
      postgres_instance_sku_name                     = "GP_Standard_D2s_v3"
      enable_replica_readonly               = try("Sim","false") == "Sim" ? true : false
      postgres_replica_sku_name = "GP_Standard_D2s_v3"

      tags = {
        "env"         =  "prd" == "stg" ? "staging" : "prd" == "sdx" ? "sandbox" : "production" 
        "cost-center" = "800010020"
        "project"     = "castform"
        "owner"       = "group:default/team-b"
      }
  }
}
