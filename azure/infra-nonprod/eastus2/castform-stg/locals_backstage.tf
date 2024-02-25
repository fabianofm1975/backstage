locals {
  backstage = {
      env             = "stg"
      subscription_name = ""
      resource_group_name            = "-stg"
      resource_group_location = "eastus2"
      postgres_instance_name                         = ""
      postgres_instance_version                      = 
      postgres_instance_storage_mb                   = 
      postgres_instance_sku_name                     = ""
      enable_replica_readonly               = "" == "true" ? true : false

      tags = {
        "env"         =  "stg" == "stg" ? "staging" : "prd" == "sdx" ? "sandbox" : "production" 
        "cost-center" = "860290034"
        "project"     = "{{ values.project }}"
        "owner"       = ""
      }

     app_user = "castform"
  }
}
