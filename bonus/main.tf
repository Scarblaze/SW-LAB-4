terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# Convert list → map (required for for_each)
locals {
  containers = {
    for c in var.container_config :
    c.name => c
  }
}

# Create module instance for each container
module "nginx_containers" {
  source = "./modules/nginx_container"

  for_each = local.containers

  container_name = each.value.name
  container_port = each.value.port
  image_name     = "nginx:latest"
}

# Output all URLs
output "container_urls" {
  value = [
    for m in module.nginx_containers :
    m.url
  ]
}