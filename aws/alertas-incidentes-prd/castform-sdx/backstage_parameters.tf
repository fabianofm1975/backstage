locals {
  backstage = {
    environment       = "sdx"
    aws_account_name  = "alertas-incidentes-prd"
    engine_version    = "14"
    family            = "postgres14"
    instance_name     = "castform-sdx"
    instance_class    = "db.t4g.medium"
    allocated_storage = 10
    aws_region        = "us-east-1"

    enable_replica_readonly               = try("Sim","false") == "Sim" ? true : false
    postgres_replica_sku_name = "db.t4g.medium"

    env         =  "sdx" == "stg" ? "staging" : "prd" == "sdx" ? "sandbox" : "production" 
    cost-center = "860290031"
    project     = "castform"
    owner     = "group:default/team-d"
  }
}
