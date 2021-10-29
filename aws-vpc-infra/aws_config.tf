terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~>3.60"
        }
    }
}

provider "aws" {
    profile = var.aws_profile
    region = var.aws_region
    default_tags {
        tags = {
            Owner = var.owner
            Environment = var.environment
            Terraform   = "true"
        }
    }
}