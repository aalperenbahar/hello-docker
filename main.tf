terraform {
  #required_providers {
  # docker = {
  #  source  = "kreuzwerker/docker"
  # version = "~> 2.13.0"
  # }
  #}
  cloud {
    organization = "aaalperenbahar"

    workspaces {
      name = "hello-docker"
    }
  }
}

provider "docker" {}


resource "docker_container" "helloworld" {
  image   = "helloworld:latest"
  name    = "helloworld"
  restart = "always"
  volumes {
    container_path = "/var/lib/docker"
    # replace the host_path with full path for your project directory starting from root directory /
    host_path = "/Users/alperenbahar/Desktop/Projects/py-dockerex"
    read_only = false
  }
  ports {
    internal = 5000
    external = 8080
  }
}
