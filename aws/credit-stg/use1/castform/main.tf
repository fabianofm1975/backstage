module "rds-postgresql-primary" {
  source = "git::git@github.com:stone-payments/data-persistence-terraform-modules.git//modules/aws-rds-postgresql"

  apply_immediately            = local.apply_immediately
  auto_minor_version_upgrade   = local.auto_minor_version_upgrade
  aws_account_id               = local.aws_account_id
  backup_retention_days        = local.backup_retention_days
  cost-center                  = local.cost-center
  enable_multi_az              = local.enable_multi_az
  engine_version               = local.engine_version
  environment                  = local.environment
  owner                        = local.owner
  family                       = local.family
  instance_name                = local.instance_name
  instance_class               = local.instance_class
  performance_insights_enabled = local.performance_insights_enabled
  project                      = local.project
  aws_region                   = local.aws_region
  allocated_storage            = local.allocated_storage
  vpc_id                       = local.vpc_id
  create_dashboard_cloudwatch  = local.create_dashboard_cloudwatch
  subnet_ids                   = local.subnet_ids
  create_ec2_bastion           = local.create_ec2_bastion
  create_s3_bucket             = local.create_s3_bucket
  custom_sg_ingress_rules      = local.custom_sg_ingress_rules
  custom_sg_egress_rules       = local.custom_sg_egress_rules
  custom_parameters            = local.custom_parameters
}
