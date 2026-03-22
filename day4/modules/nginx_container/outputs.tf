output "container_name" {
  value = docker_container.nginx_container.name
}

output "service_url" {
  value = "http://localhost:${var.container_port}"
}