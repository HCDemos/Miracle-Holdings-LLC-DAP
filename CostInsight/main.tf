terraform {

  backend "s3" {
    bucket               = "dap-tfc-state"
    workspace_key_prefix = "terraform-states/cost-insight/terraform.tfstate"
    key                  = "terraform.tfstate"
    region               = "us-east-1"
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


module "shared_module_consumer" {
  source           = "../Shared-Module"
  workspace_name   = terraform.workspace
  application_name = "cost-insight"
}
