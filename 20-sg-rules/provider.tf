terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.33.0" # terrafomr aws provider version
    }
    http = {
      source  = "hashicorp/http"
      version = "3.4.5"
    }
  }
  
  backend "s3" {
    bucket         = "remote-state-vineeth-demo"
    key            = "roboshop-dev-sg-rules"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile = true
  }
}
# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

