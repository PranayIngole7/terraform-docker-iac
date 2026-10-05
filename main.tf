terraform {
  required_version = ">= 1.2.0"
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

provider "docker" {}

# Resource to pull the Nginx Docker image
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

# Resource to provision and manage the Nginx container
resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "iac-nginx-container"

  ports {
    internal = 80
    external = 8080
  }
}
