terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.33.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.2.1"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.7.0"
    }
    null = {
      source = "hashicorp/null"
      version = "3.2.4"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "5.17.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


provider "cloudflare" {
  api_token = "nreNDUKf2CrOh6dgWKN3ArXCbdtcu3L3UV4UZmBE"
}


