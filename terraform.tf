terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0-beta3"
    }
  }

  backend "s3" {
    bucket         = "tws-junoon-state-bucket-ayush"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "tws-junoon-state-table"
  }
}