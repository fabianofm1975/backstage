locals {
  firewall = {
    postgres_instance_server_firewall = [
      {
        name             = "Atlantis_1"
        start_ip_address = "44.206.79.98"
        end_ip_address   = "44.206.79.98"
      },
      {
        name             = "Atlantis_2"
        start_ip_address = "52.70.24.181"
        end_ip_address   = "52.70.24.181"
      },
      {
        name             = "Atlantis_3"
        start_ip_address = "54.196.242.191"
        end_ip_address   = "54.196.242.191"
      },
      {
        name             = "Atlantis_4"
        start_ip_address = "44.196.181.193"
        end_ip_address   = "44.196.181.193"
      },
      {
        name             = "JumpDBA-ATL-PRIV"
        start_ip_address = "10.99.6.31"
        end_ip_address   = "10.99.6.31"
      },
      {
        name             = "Karavelas-PRD"
        start_ip_address = "10.150.140.1"
        end_ip_address   = "10.150.141.254"
      },
      {
        name             = "Karavelas-DR"
        start_ip_address = "10.151.140.1"
        end_ip_address   = "10.151.141.254"
      },
      {
        name             = "Github_Actions_Runner_1"
        start_ip_address = "10.10.3.103"
        end_ip_address   = "10.10.3.103"
      },
      {
        name             = "Github_Actions_Runner_2"
        start_ip_address = "10.100.32.152"
        end_ip_address   = "10.100.32.152"
      },
      {
        name             = "Github_Actions_Runner_3"
        start_ip_address = "10.104.4.172"
        end_ip_address   = "10.104.4.172"
      },
      {
        name             = "allow_GSN_1"
        start_ip_address = "10.171.36.1"
        end_ip_address   = "10.171.39.254"
      },
      {
        name             = "allow_GSN_2"
        start_ip_address = "10.171.32.1"
        end_ip_address   = "10.171.35.254"
      },
      {
        name             = "allow_GSN_3"
        start_ip_address = "10.171.40.1"
        end_ip_address   = "10.171.43.254"
      }
    ]
  }
}
