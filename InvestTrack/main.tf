terraform {

  backend "s3" {
    bucket = "dap-tfc-state"
    key    = "terraform-states/invest-track/terraform.tfstate"
    region = "us-east-1"
  }
  required_providers {
    aws = {
      version = ">= 5.39.0"
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}


resource "aws_security_group" "Critical-Security-Group" {
  name        = "Critical-Security-Group"
  description = "Open access within this region"
  vpc_id      = "vpc-0a370eb440da35c29"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    createdBy     = "terraform"
    terraformTime = "${timestamp()}"
    CanDelete     = "true"
    Product       = "invest-track"
  }
}

