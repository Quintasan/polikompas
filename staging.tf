resource "hcloud_server" "staging" {
  name        = "staging"
  image       = "ubuntu-18.04"
  server_type = "cx11"
  ssh_keys = [
    "quintasan@demonbane",
    "quintasan@shirase",
  ]
}

resource "ovh_domain_zone_record" "staging" {
  zone      = "konsultacjeobywatelskie.pl"
  subdomain = "staging"
  fieldtype = "A"
  ttl       = "3600"
  target    = hcloud_server.staging.ipv4_address
}
