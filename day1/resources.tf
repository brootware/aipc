variable "image_name" {
  type = string
}

variable "container_name" {
  type    = string
  default = "c0"
}

variable "container_port" {
  type    = number
  default = 3000
}

variable "exposed_port" {
  type    = number
  default = 8080
}

resource "docker_image" "fortune" {
  name = var.image_name
}

resource "docker_container" "fortune" {
  name  = var.container_name
  image = docker_image.fortune.latest
  ports {
    internal = var.container_port
    external = var.exposed_port
  }
}
