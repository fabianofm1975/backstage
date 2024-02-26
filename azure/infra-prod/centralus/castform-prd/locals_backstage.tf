locals {
  backstage = {
      env             = "prd"
      subscription_name = "INFRA-PROD"
      resource_group_name            = "castform-prd"
      resource_group_location = "centralus"
      postgres_instance_name                         = "castform-prd"
      postgres_instance_version                      = 14
      postgres_instance_storage_mb                   = 65536
      postgres_instance_sku_name                     = "GP_Standard_D2s_v3"
      enable_replica_readonly               = try("true","false") == "true" ? true : false
      postgres_replica_sku_name = "GP_Standard_D2s_v3"

      tags = {
        "env"         =  "prd" == "stg" ? "staging" : "prd" == "sdx" ? "sandbox" : "production"
        "cost-center" = "860290010"
        "project"     = "castform"
        "owner"       = "group:default/infrastructure"
      }

     app_user = "castform"
  }
}

