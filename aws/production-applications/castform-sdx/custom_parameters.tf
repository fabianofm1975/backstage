locals {
  custom = {
    enable_multi_az              = "sdx" == "stg" ? false : true
    performance_insights_enabled = true
    create_dashboard_cloudwatch  = true
    backup_retention_days        = 35
    apply_immediately            = true
    auto_minor_version_upgrade   = true
    create_ec2_bastion           = true
    create_s3_bucket             = false

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
}
