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

resource "digitalocean_droplet" "yoursql" {
  image    = data.digitalocean_image.mysql8.id
  name     = "yoursql"
  region   = "sgp1"
  size     = "s-1vcpu-1gb"
  ssh_keys = [data.digitalocean_ssh_key.aipc.id]
}
