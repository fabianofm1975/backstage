module "rds-postgresql-primary" {
  source = "git@github.com:stone-payments/infra-cloud-psql.git//modules/aws-rds-postgresql-backstage"

  environment       = local.backstage.environment
  aws_account_name  = local.backstage.aws_account_name
  engine_version    = local.backstage.engine_version
  family            = local.backstage.family
  instance_name     = local.backstage.instance_name
  instance_class    = local.backstage.instance_class
  aws_region        = local.backstage.aws_region
  allocated_storage = local.backstage.allocated_storage

  owner       = local.backstage.owner
  project     = local.backstage.project
  cost-center = local.backstage.cost-center

  performance_insights_enabled = local.custom.performance_insights_enabled
  backup_retention_days        = local.custom.backup_retention_days
  enable_multi_az              = local.custom.enable_multi_az
  create_dashboard_cloudwatch  = local.custom.create_dashboard_cloudwatch
  create_ec2_bastion           = local.custom.create_ec2_bastion
  create_s3_bucket             = local.custom.create_s3_bucket
  apply_immediately            = local.custom.apply_immediately
  auto_minor_version_upgrade   = local.custom.auto_minor_version_upgrade
  custom_parameters            = local.custom.custom_parameters

  custom_sg_ingress_rules = local.firewall.custom_sg_ingress_rules
  custom_sg_egress_rules  = local.firewall.custom_sg_egress_rules
}

