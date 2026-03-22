terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

# Variable for filename
variable "filename" {
  description = "Name of the file to create"
  type        = string
}

# Variable for message content
variable "message" {
  description = "Content to write inside the file"
  type        = string
}

# Resource: Create local file
resource "local_file" "env_file" {
  filename = var.filename
  content  = var.message
}

# Output: Display created file name
output "created_file" {
  value = local_file.env_file.filename
}