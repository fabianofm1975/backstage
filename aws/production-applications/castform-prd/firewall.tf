locals {
  firewall = {
    custom_sg_ingress_rules = {
      regra1 = {
        description = "Allow Karavela to PostgreSQL Port"
        from_port   = 5432
        to_port     = 5432
        protocol    = "tcp"
        cidr_blocks = ["10.172.0.0/16"]
      },
      regra2 = {
        description = "Allow Karavela to PostgreSQL Port"
        from_port   = 5432
        to_port     = 5432
        protocol    = "tcp"
        cidr_blocks = ["10.171.0.0/16"]
      },
      regra3 = {
        description = "Allow Github_Actions_Runner_1"
        from_port   = 5432
        to_port     = 5432
        protocol    = "tcp"
        cidr_blocks = ["10.10.3.103/32"]
      },
      regra4 = {
        description = "Allow  Github_Actions_Runner_2"
        from_port   = 5432
        to_port     = 5432
        protocol    = "tcp"
        cidr_blocks = ["10.100.32.152/32"]
      },
      regra5 = {
        description = "Allow  Github_Actions_Runner_3"
        from_port   = 5432
        to_port     = 5432
        protocol    = "tcp"
        cidr_blocks = ["10.104.4.172/32"]
      }
    }

    custom_sg_egress_rules = {
      regra1 = {
        description = "Allow Karavela Outbound"
        from_port   = 0
        to_port     = 0
        protocol    = -1
        cidr_blocks = ["10.172.0.0/16"]
      },
      regra2 = {
        description = "Allow Karavela Outbound"
        from_port   = 0
        to_port     = 0
        protocol    = -1
        cidr_blocks = ["10.171.0.0/16"]
      },
      regra3 = {
        description = "Allow Github_Actions_Runner_1"
        from_port   = 5432
        to_port     = 5432
        protocol    = "tcp"
        cidr_blocks = ["10.10.3.103/32"]
      },
      regra4 = {
        description = "Allow  Github_Actions_Runner_2"
        from_port   = 5432
        to_port     = 5432
        protocol    = "tcp"
        cidr_blocks = ["10.100.32.152/32"]
      },
      regra5 = {
        description = "Allow  Github_Actions_Runner_3"
        from_port   = 5432
        to_port     = 5432
        protocol    = "tcp"
        cidr_blocks = ["10.104.4.172/32"]
      }
    }
  }
}
