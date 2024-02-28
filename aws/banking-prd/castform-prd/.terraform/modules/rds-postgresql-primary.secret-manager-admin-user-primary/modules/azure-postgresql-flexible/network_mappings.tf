# Network Section

variable "vnet_settings" {
  type = object({
    subscription = map(object({
      region = map(object({
        parameter = map(string)
      }))
    }))
  })
  default = {
    subscription = {
      "INFRA-NONPROD" = {
        region = {
          "centralus" = {
            parameter = {
              "vnet_name"           = "VirtualNetwork-CE-STG"
              "vnet_resource_group" = "Networking-CE-STG"
              "vnet_subnet_name"    = "Subnet_Databases"
            }
          },
          "eastus2" = {
            parameter = {
              "vnet_name"           = "VirtualNetwork-EC2-STG"
              "vnet_resource_group" = "Networking-EC2-STG"
              "vnet_subnet_name"    = "Subnet_Databases"
            }
          }
        }
      },
      "INFRA-PROD" = {
        region = {
          "centralus" = {
            parameter = {
              "vnet_name"           = "VirtualNetwork-CE-PRD"
              "vnet_resource_group" = "Networking-CE-PRD"
              "vnet_subnet_name"    = "Subnet_Databases"
            }
          },
          "eastus2" = {
            parameter = {
              "vnet_name"           = "VirtualNetwork-EC2-PRD"
              "vnet_resource_group" = "Networking-EC2-PRD"
              "vnet_subnet_name"    = "Subnet_Databases"
            }
          }
        }
      },
      "CONTROLLERSHIP-NONPRD" = {
        region = {
          "centralus" = {
            parameter = {
              "vnet_name"           = "VirtualNetwork-CE-STG"
              "vnet_resource_group" = "Networking-CE-STG"
              "vnet_subnet_name"    = "Subnet_Databases"
            }
          },
          "eastus2" = {
            parameter = {
              "vnet_name"           = "VirtualNetwork-EC2-STG"
              "vnet_resource_group" = "Networking-EC2-STG"
              "vnet_subnet_name"    = "Subnet_Databases"
            }
          }
        }
      },
      "CONTROLLERSHIP-PROD" = {
        region = {
          "centralus" = {
            parameter = {
              "vnet_name"           = "VirtualNetwork-CE-PRD"
              "vnet_resource_group" = "Networking-CE-PRD"
              "vnet_subnet_name"    = "Subnet_Databases"
            }
          },
          "eastus2" = {
            parameter = {
              "vnet_name"           = "VirtualNetwork-EC2-PRD"
              "vnet_resource_group" = "Networking-EC2-PRD"
              "vnet_subnet_name"    = "Subnet_Databases"
            }
          }
        }
      },
      "FINANCIALPRODUCTS-NONPRD" = {
        region = {
          "eastus2" = {
            parameter = {
              "vnet_name"           = "VNET-Credit-EastUS2-STG"
              "vnet_resource_group" = "Networking-EC2-STG"
              "vnet_subnet_name"    = "Subnet_Databases"
            }
          }
        }
      },
      "FINANCIALPRODUCTS-PROD" = {
        region = {
          "centralus" = {
            parameter = {
              "vnet_name"           = "VNET-Credit-CentralUS-PRD"
              "vnet_resource_group" = "Networking-CE-PRD"
              "vnet_subnet_name"    = "Subnet_Databases"
            }
          },
          "eastus2" = {
            parameter = {
              "vnet_name"           = "VNET-Credit-EastUS2-PRD"
              "vnet_resource_group" = "Networking-EC2-PRD"
              "vnet_subnet_name"    = "Subnet_Databases"
            }
          }
        }
      },
      "FRONT-NONPROD" = {
        region = {
          "centralus" = {
            parameter = {
              "vnet_name"           = "VirtualNetwork-CE-STG"
              "vnet_resource_group" = "Networking-CE-STG"
              "vnet_subnet_name"    = "Subnet_Databases"
            }
          },
          "eastus2" = {
            parameter = {
              "vnet_name"           = "VirtualNetwork-EC2-STG"
              "vnet_resource_group" = "Networking-EC2-STG"
              "vnet_subnet_name"    = "Subnet_Databases"
            }
          }
        }
      },
      "FRONT-PROD" = {
        region = {
          "centralus" = {
            parameter = {
              "vnet_name"           = "VirtualNetwork-CE-PRD"
              "vnet_resource_group" = "Networking-CE-PRD"
              "vnet_subnet_name"    = "Subnet_Databases"
            }
          },
          "eastus2" = {
            parameter = {
              "vnet_name"           = "VirtualNetwork-EC2-PRD"
              "vnet_resource_group" = "Networking-EC2-PRD"
              "vnet_subnet_name"    = "Subnet_Databases"
            }
          }
        }
      },
      "MUNDIPAGG-STAGING" = {
        region = {
          "centralus" = {
            parameter = {
              "vnet_name"           = ""
              "vnet_resource_group" = ""
            }
          },
          "eastus2" = {
            parameter = {
              "vnet_name"           = ""
              "vnet_resource_group" = ""
            }
          }
        }
      },
      "MUNDIPAGG-PROD" = {
        region = {
          "centralus" = {
            parameter = {
              "vnet_name"           = ""
              "vnet_resource_group" = ""
            }
          },
          "eastus2" = {
            parameter = {
              "vnet_name"           = ""
              "vnet_resource_group" = ""
            }
          }
        }
      },
      "PROCESSOR-NONPRD" = {
        region = {
          "centralus" = {
            parameter = {
              "vnet_name"           = "VirtualNetwork-CE-STG"
              "vnet_resource_group" = "Networking-CE-STG"
              "vnet_subnet_name"    = "Subnet_Databases"
            }
          },
          "eastus2" = {
            parameter = {
              "vnet_name"           = "VirtualNetwork-EC2-STG"
              "vnet_resource_group" = "Networking-EC2-STG"
              "vnet_subnet_name"    = "Subnet_Databases"
            }
          }
        }
      },
      "PROCESSOR-PROD" = {
        region = {
          "centralus" = {
            parameter = {
              "vnet_name"           = "VirtualNetwork-CE-PRD"
              "vnet_resource_group" = "Networking-CE-PRD"
              "vnet_subnet_name"    = "Subnet_Databases"
            }
          },
          "eastus2" = {
            parameter = {
              "vnet_name"           = "VirtualNetwork-EC2-PRD"
              "vnet_resource_group" = "Networking-EC2-PRD"
              "vnet_subnet_name"    = "Subnet_Databases"
            }
          }
        }
      },
      "RISK-NONPROD" = {
        region = {
          "centralus" = {
            parameter = {
              "vnet_name"           = "VirtualNetwork-CE-STG"
              "vnet_resource_group" = "Networking-CE-STG"
              "vnet_subnet_name"    = "Subnet_Databases"
            }
          },
          "eastus2" = {
            parameter = {
              "vnet_name"           = "VirtualNetwork-EC2-STG"
              "vnet_resource_group" = "Networking-EC2-STG"
              "vnet_subnet_name"    = "Subnet_Databases"
            }
          }
        }
      },
      "RISK-PROD" = {
        region = {
          "centralus" = {
            parameter = {
              "vnet_name"           = "VirtualNetwork-CE-PRD"
              "vnet_resource_group" = "Networking-CE-PRD"
              "vnet_subnet_name"    = "Subnet_Databases"
            }
          },
          "eastus2" = {
            parameter = {
              "vnet_name"           = "VirtualNetwork-EC2-PRD"
              "vnet_resource_group" = "Networking-EC2-PRD"
              "vnet_subnet_name"    = "Subnet_Databases"
            }
          }
        }
      },
      "TREASURY-NONPRD" = {
        region = {
          "centralus" = {
            parameter = {
              "vnet_name"           = "VirtualNetwork-CE-STG"
              "vnet_resource_group" = "Networking-CE-STG"
              "vnet_subnet_name"    = "Subnet_Databases"
            }
          },
          "eastus2" = {
            parameter = {
              "vnet_name"           = "VirtualNetwork-EC2-STG"
              "vnet_resource_group" = "Networking-EC2-STG"
              "vnet_subnet_name"    = "Subnet_Databases"
            }
          }
        }
      },
      "TREASURY-PROD" = {
        region = {
          "centralus" = {
            parameter = {
              "vnet_name"           = "VirtualNetwork-CE-PRD"
              "vnet_resource_group" = "Networking-CE-PRD"
              "vnet_subnet_name"    = "Subnet_Databases"
            }
          },
          "eastus2" = {
            parameter = {
              "vnet_name"           = "VirtualNetwork-EC2-PRD"
              "vnet_resource_group" = "Networking-EC2-PRD"
              "vnet_subnet_name"    = "Subnet_Databases"
            }
          }
        }
      }
    }
  }
}
