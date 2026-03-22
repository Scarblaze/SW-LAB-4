terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# Container 1 (port 8081)
module "nginx1" {
  source = "./modules/nginx_container"

  container_name = "nginx-container-1"
  container_port = 8081
  image_name     = "nginx:latest"
}

# Container 2 (port 8082)
module "nginx2" {
  source = "./modules/nginx_container"

  container_name = "nginx-container-2"
  container_port = 8082
  image_name     = "nginx:latest"
}

# Outputs
output "nginx1_url" {
  value = module.nginx1.service_url
}

output "nginx2_url" {
  value = module.nginx2.service_url
}