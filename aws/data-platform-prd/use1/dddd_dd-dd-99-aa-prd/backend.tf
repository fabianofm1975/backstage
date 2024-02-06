terraform {
  backend "s3" {
    bucket         = "foundation-platform-terraform-state-tools-prd"
    dynamodb_table = "atlantis-eks-stone-tools-prd"
    encrypt        = true
    key            = "data-persistence-terraform-deploys/aws/alertas-incidentes-stg/use1/rds/postgresql/castform-stg/terraform.tfstate"
    region         = "us-east-1"
    role_arn       = "arn:aws:iam::322745845743:role/atlantis-eks-bucket-policy-stone-tools-prd"
  }
}
