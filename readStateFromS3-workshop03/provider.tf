terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.12.0"
    }
  }
  backend "s3" {
    endpoint                    = "sgp1.digitaloceanspaces.com"
    key                         = "workshop03-tfprovision/terraform.tfstate"
    bucket                      = "autospace"
    region                      = "sgp1"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    access_key                  = "value"
  }
}

provider "digitalocean" {
  token = var.DO_token
}
