backend "file" {
  path = "/data/vault"
}

listener "tcp" {
  address = "0.0.0.0:8200"
  tls_disable = false
  tls_cert_file = "/etc/letsencrypt/live/vault.caregiversense.com/cert.pem"
  tls_key_file = "/etc/letsencrypt/live/vault.caregiversense.com/privkey.pem"
}

disable_mlock = true
max_lease_ttl = "99999h"
default_lease_ttl = "99999h"
