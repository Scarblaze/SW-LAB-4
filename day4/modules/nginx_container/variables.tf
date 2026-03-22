variable "container_name" {
  description = "Name of the Docker container"
  type        = string
}

variable "container_port" {
  description = "Host port to expose container"
  type        = number
}

variable "image_name" {
  description = "Docker image name"
  type        = string
  default     = "nginx:latest"
}