terraform {
  required_version = ">=1.0.0"
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.15.0"
    }
  }
}

provider "docker" {
  host      = "tcp://128.199.132.208:2376"
  cert_path = "/Users/bruceymac/.docker/machine/machines/my-docker"
}
