terraform {
  required_version = ">= 0.13"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    region  = "us-east-1"
    bucket  = "ppshein-upgrad-devops-tfstate"
    key     = "upgrad.tfstate"
    encrypt = true
  }
}
