terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.33.0" # terrafomr aws provider version
    }
  }
  
  backend "s3" {
    bucket         = "remote-state-vineeth-demo"
    key            = "remote-state.tfstate"
    region         = "us-east-1"
    dynamodb_table = "your-dynamodb-lock-table"
    encrypt        = true
    use_lockfile = true
  }
}
# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

