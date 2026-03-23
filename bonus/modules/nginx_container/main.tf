terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

resource "docker_image" "nginx_image" {
  name         = var.image_name
  keep_locally = false
}

resource "docker_container" "nginx_container" {
  name  = var.container_name
  image = docker_image.nginx_image.image_id

  ports {
    internal = 80
    external = var.container_port
  }
}