resource "hcloud_server" "production" {
  name = "production"
  image = "ubuntu-18.04"
  server_type = "cx11"
  ssh_keys = [
    "quintasan@demonbane",
    "quintasan@shirase"
  ]
}

output "ip" {
  value = "${hcloud_server.production.ipv4_address}"
}
