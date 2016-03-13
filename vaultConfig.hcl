backend "file" {
  path = "/data/vault"
}

listener "tcp" {
  address = "0.0.0.0:8200"
  tls_disable = 1
}

disable_mlock = true
max_lease_ttl = "99999h"
default_lease_ttl = "99999h"
