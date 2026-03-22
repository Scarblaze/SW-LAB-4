terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

# Configure Docker provider
provider "docker" {}

# Pull nginx image
resource "docker_image" "nginx_image" {
  name         = "nginx:latest"
  keep_locally = false
}

# Create container
resource "docker_container" "nginx_container" {
  name  = "terraform-nginx"
  image = docker_image.nginx_image.image_id

  ports {
    internal = 80
    external = 8080
  }
}

# Output service URL
output "service_url" {
  value = "http://localhost:8080"
}