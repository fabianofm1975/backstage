locals {
  backstage = {
      env             = "prd"
      subscription_name = "INFRA-PROD"
      resource_group_name            = "castform-prd"
      resource_group_location = "centralus"
      postgres_instance_name                         = "castform-prd-db"
      postgres_instance_version                      = 14
      postgres_instance_storage_mb                   = 49152
      postgres_instance_sku_name                     = "GP_Standard_D2s_v3"
      enable_replica_readonly               = "true" == "true" ? true : false

      tags = {
        "env"         =  "prd" == "stg" ? "staging" : "prd" == "sdx" ? "sandbox" : "production" 
        "cost-center" = "860290033"
        "project"     = "castform"
        "owner"       = "group:default/infrastructure"
      }

     app_user = "${{ values.postgres_instance_name }}"
  }
}
