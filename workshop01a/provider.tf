terraform {
  required_version = ">=1.0.0"
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.12.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.1.0"
    }
  }

}

# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}

provider "local" {

}
