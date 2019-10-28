resource "hcloud_server" "production" {
  name        = "production"
  image       = "ubuntu-18.04"
  server_type = "cx11"
  ssh_keys = [
    "quintasan@demonbane",
    "quintasan@shirase",
  ]
}

resource "ovh_domain_zone_record" "production-root" {
  zone      = "konsultacjeobywatelskie.pl"
  subdomain = ""
  fieldtype = "A"
  ttl       = "3600"
  target    = hcloud_server.production.ipv4_address
}

resource "ovh_domain_zone_record" "production-www" {
  zone      = "konsultacjeobywatelskie.pl"
  subdomain = "www"
  fieldtype = "A"
  ttl       = "3600"
  target    = hcloud_server.production.ipv4_address
}
