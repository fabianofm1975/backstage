locals {
  backstage = {
    environment       = "prd"
    aws_account_name  = "production-applications"
    engine_version    = "15"
    family            = "postgres15"
    instance_name     = "castform-prd"
    instance_class    = ""
    allocated_storage = 20
    aws_region        = "us-east-1"

    enable_replica_readonly               = try("Sim","false") == "Sim" ? true : false
    postgres_replica_sku_name = ""

    env         =  "prd" == "stg" ? "staging" : "prd" == "sdx" ? "sandbox" : "production" 
    cost-center = "810120320"
    project     = "castform"
    owner     = "group:default/team-c"
  }
}
