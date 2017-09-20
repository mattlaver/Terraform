provider "docker" {
  host = "${var.docker_host}"
}

resource "docker_image" "nginx" {
  name = "nginx:alpine"
}

resource "docker_container" "nginx-server" {
  name  = "nginx-server"
  image = "${docker_image.nginx.latest}"

  ports {
    internal = 80
    external = 32780
  }
}
