variable "region" {
  type    = string
  default = "us-east-1"
}

variable "access_key" {}
variable "secret_key" {}

variable "project" {
  type        = string
  description = "The name of the project."
}

variable "environment" {
  type        = string
  description = "The name of the environment."
}

# declare Network layer attribute here
variable "vpc" {
  description = "The attribute of VPC information"
  type = object({
    name                      = string
    cidr_block                = string
    enable_dns_hostnames      = bool
    number_of_public_subnets  = number
    number_of_private_subnets = number
  })
}

variable "sample_app" {
  description = "The name of sample app name to be deployed"
  type        = string
  default     = "upg-loadme"
}
