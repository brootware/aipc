variable "DO_token" {
  type      = string
  sensitive = true
}

# lookup the ssh key from digital ocean settings
data "digitalocean_ssh_key" "aipc" {
  name = "aipc"
}

# define the resource - droplet
resource "digitalocean_droplet" "myserver" {
  # mandatory attributes
  count  = 2
  name   = "myserver-${count.index}"
  image  = "ubuntu-20-10-x64"
  size   = "s-1vcpu-2gb"
  region = "sgp1"

  # ssh key
  ssh_keys = [data.digitalocean_ssh_key.aipc.id]
}

output "myserver_ip" {
  value = { for d in digitalocean_droplet.myserver : d.name => d.ipv4_address }
}
