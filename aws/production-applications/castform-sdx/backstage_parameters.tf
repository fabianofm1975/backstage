locals {
  backstage = {
    environment       = "sdx"
    aws_account_name  = "production-applications"
    engine_version    = "15"
    family            = "postgres15"
    instance_name     = "castform-sdx"
    instance_class    = "db.t4g.small"
    allocated_storage = 80
    aws_region        = "us-east-1"

    enable_replica_readonly               = try("Sim","false") == "Sim" ? true : false
    postgres_replica_sku_name = "db.t4g.small"

    env         =  "sdx" == "stg" ? "staging" : "prd" == "sdx" ? "sandbox" : "production" 
    cost-center = "860290036"
    project     = "castform"
    owner     = "group:default/team-d"
  }
}
