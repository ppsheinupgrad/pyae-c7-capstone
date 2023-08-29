# Use the Amazon Web Services (AWS) provider to interact with the many resources supported by AWS.
provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}
