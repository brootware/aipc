variable "DO_token" {
  type      = string
  sensitive = true
}

data "digitalocean_ssh_key" "aipc" {
  name = "aipc"
}

data "digitalocean_image" "mysql8" {
  name = "mysql8"
}

data "terraform_remote_state" "yoursql" {
  backend = "s3"
  config = {
    endpoint                    = "sgp1.digitaloceanspaces.com"
    key                         = "workshop03-tfprovision/terraform.tfstate"
    bucket                      = "autospace"
    region                      = "sgp1"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
  }
}
output "database_endpoint" {
  value = data.terraform_remote_state.yoursql.config
}
