project     = "pyae-c7-capstone-eks"
environment = "dev"

vpc = {
  cidr_block                = "10.20.0.0/16"
  enable_dns_hostnames      = false
  name                      = "vpc"
  number_of_public_subnets  = 2
  number_of_private_subnets = 2
}

sample_app = "upg-loadme"
