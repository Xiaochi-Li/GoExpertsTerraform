
terraform {

  # cloud {
  #   organization = "sean-li-terraform-cloud-learning"

  #   workspaces {
  #     name = "aws_frontend_dev"
  #   }
  # }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.0.0"
    }
  }
}

locals {
  domain_name = "xiaochiligoexpert.link"
}

module "cloudfront_s3_website_with_domain" {
  source      = "../../modules/aws-s3-cloudfront"
  domain_name = "dev.${local.domain_name}"
  bucket_name = "dev.${local.domain_name}"
  common_tags = { Project = "goexperts-${terraform.workspace}" }
  aws_region  = "ap-southeast-2"
  environment = "dev"
  zone        = local.domain_name
}
