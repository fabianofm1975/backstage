locals {
  backstage = {
    environment       = "prd"
    aws_account_name  = "production-applications"
    engine_version    = "15"
    family            = "postgres15"
    instance_name     = "castform-prd"
    instance_class    = "db.t4g.small"
    allocated_storage = 40
    aws_region        = "us-east-1"

    enable_replica_readonly               = try("Sim","false") == "Sim" ? true : false
    postgres_replica_sku_name = "db.t4g.small"

    env         =  "prd" == "stg" ? "staging" : "prd" == "sdx" ? "sandbox" : "production" 
    cost-center = "860290030"
    project     = "castform"
    owner     = "group:default/infrastructure"
  }
}
