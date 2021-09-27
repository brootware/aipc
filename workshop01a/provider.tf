terraform {
  required_version = ">=1.0.0"
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.12.0"
    }
  }
}

# Set the variable value in *.tfvars file
# or using -var="do_token=..." CLI option
variable "do_token" {
  type      = string
  sensitive = true
}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}
