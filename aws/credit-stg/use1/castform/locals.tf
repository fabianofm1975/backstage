locals {
  apply_immediately            = true
  auto_minor_version_upgrade   = true
  aws_account_id               = "860928853269"
  aws_region                   = "us-east-1"
  backup_retention_days        = 7
  cost-center                  = "820141020"
  subnet_ids                   = ["subnet-0b48f64ed0ca87d41", "subnet-08decd91e417b50c7", "subnet-0c6605bf2e92e086c"]
  enable_multi_az              = false
  engine_version               = "15"
  environment                  = "staging"
  owner                        = "pai-integracoes"
  family                       = "postgres15"
  instance_name                = "castform-stg-db"
  instance_class               = "db.t4g.medium"
  performance_insights_enabled = false
  project                      = "castform"
  allocated_storage            = 10
  create_dashboard_cloudwatch  = true
  vpc_id                       = "vpc-021340b85e97e31df"
  create_ec2_bastion           = false
  create_s3_bucket             = false

  ###AWS - Production Applications
  custom_sg_ingress_rules = {
    regra1 = {
      description = "Allow Karavela to PostgreSQL Port"
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      cidr_blocks = ["10.172.0.0/16"] ###AWS - Staging Applications
    },
    regra2 = {
      description = "Allow Karavela to PostgreSQL Port"
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      cidr_blocks = ["10.171.0.0/16"] ###AWS - Production Applications
    },
    regra3 = {
      description = "Allow Github_Actions_Runner_1"
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      cidr_blocks = ["10.10.3.103/32"] ###AWS - Production Applications
    },
    regra4 = {
      description = "Allow  Github_Actions_Runner_2"
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      cidr_blocks = ["10.100.32.152/32"] ###AWS - Production Applications
    },
    regra5 = {
      description = "Allow  Github_Actions_Runner_3"
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      cidr_blocks = ["10.104.4.172/32"] ###AWS - Production Applications
    }
  }

  custom_sg_egress_rules = {
    regra1 = {
      description = "Allow Karavela Outbound"
      from_port   = 0
      to_port     = 0
      protocol    = -1                #"tcp"
      cidr_blocks = ["10.172.0.0/16"] ###AWS - Staging Applications
    },
    regra2 = {
      description = "Allow Karavela Outbound"
      from_port   = 0
      to_port     = 0
      protocol    = -1                #"tcp"
      cidr_blocks = ["10.171.0.0/16"] ###AWS -Production Applications
    },
    regra3 = {
      description = "Allow Github_Actions_Runner_1"
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      cidr_blocks = ["10.10.3.103/32"] ###AWS - Production Applications
    },
    regra4 = {
      description = "Allow  Github_Actions_Runner_2"
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      cidr_blocks = ["10.100.32.152/32"] ###AWS - Production Applications
    },
    regra5 = {
      description = "Allow  Github_Actions_Runner_3"
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      cidr_blocks = ["10.104.4.172/32"] ###AWS - Production Applications
    }
  }
  custom_parameters = [
    {
      name : "pgaudit.log"
      value : "ALL"
    },
    {
      name : "pgaudit.log_parameter"
      value : "1"
    },
    {
      name : "rds.force_ssl"
      value : "0"
    }
  ]
}

