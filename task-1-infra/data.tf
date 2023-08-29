# All data source should be defined here resuable purpose

# To collect AWS Region information
data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_availability_zones" "available" {}
