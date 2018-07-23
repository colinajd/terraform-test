resource "digitalocean_droplet" "web1" {
  image     = "ubuntu-16-04-x64"
  name      = "web1"
  region    = "lon1"
  size      = "1gb"
  user_data = "${file("config/web.sh")}"

  ssh_keys = [
    "${var.ssh_fingerprint}",
  ]

  connection {
    user        = "root"
    type        = "ssh"
    private_key = "${file(var.pvt_key)}"
    timeout     = "2m"
  }
}
