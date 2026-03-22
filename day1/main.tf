terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

# Variable declaration
variable "message" {
  description = "Message to write into the file"
  type        = string
  default     = "Hello from Terraform"
}

# Resource to create a local file
resource "local_file" "hello_file" {
  filename = "hello.txt"
  content  = var.message
}

# Output to display file path
output "file_path" {
  description = "Path of the created file"
  value       = local_file.hello_file.filename
}