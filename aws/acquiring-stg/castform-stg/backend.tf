terraform {
  backend "s3" {
    encrypt        = "true"
    bucket         = "foundation-platform-terraform-state-tools-prd"
    key            = "data-persistence-terraform-deploys/aws/stone/acquiring-stg/us-east-1/postgres/castform-stg/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "atlantis-eks-stone-tools-prd"
    role_arn       = "arn:aws:iam::322745845743:role/atlantis-eks-bucket-policy-stone-tools-prd"
    session_name   = "data-persistence-terraform-deploys"
  }
}
