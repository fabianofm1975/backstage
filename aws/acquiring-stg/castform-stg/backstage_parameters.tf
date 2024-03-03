locals {
  backstage = {
    environment       = "stg"
    aws_account_name  = "acquiring-stg"
    engine_version    = "15"
    family            = "postgres15"
    instance_name     = "castform-stg"
    instance_class    = "db.t4g.medium"
    allocated_storage = 10
    aws_region        = "us-east-1"

    enable_replica_readonly               = try("","false") == "Sim" ? true : false
    postgres_replica_sku_name = "db.t4g.medium"

    env         =  "stg" == "stg" ? "staging" : "prd" == "sdx" ? "sandbox" : "production" 
    cost-center = "860290035"
    project     = "castform"
    owner     = "group:default/team-c"
  }
}
