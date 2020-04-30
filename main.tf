provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Create NGINX container
resource "docker_container" "nginx" {
  image = "${docker_image.nginx.latest}"
  name  = "webserver"
  ports {
    internal = 80
    external = 80
  }

  volumes{
    container_path = "/usr/share/nginx/html"
    host_path = "/var/www/html"
    read_only = true
  }
}

resource "docker_image" "nginx" {
  name = "nginx:1.11-alpine"
}
