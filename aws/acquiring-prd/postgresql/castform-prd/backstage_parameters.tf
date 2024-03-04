locals {
  backstage = {
    environment       = "prd"
    aws_account_name  = "acquiring-prd"
    engine_version    = "14"
    family            = "postgres14"
    instance_name     = "castform-prd"
    instance_class    = "db.t4g.small"
    allocated_storage = 20
    aws_region        = "us-east-1"

    enable_replica_readonly               = try("Sim","false") == "Sim" ? true : false
    postgres_replica_sku_name = "db.t4g.small"

    env         =  "prd" == "stg" ? "staging" : "prd" == "sdx" ? "sandbox" : "production" 
    cost-center = "860290036"
    project     = "castform"
    owner     = "group:default/team-d"
  }
}
