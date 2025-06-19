## define your cloud service provide
provider "aws" {
  region = "us-east-1" # Change this to your desired AWS region
  access_key = var.access.key
  secret_key = var.secret.key
}
