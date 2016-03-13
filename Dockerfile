# Creates a Docker image with vault installed
# Build with:
# 	docker build -t memtag/cs-vault .
#
# Run with:
#   docker run -d -v /vagrant:/data -p 80:80 -p 8200:8200 -p 443:443 memtag/cs-vault

FROM memtag/ansible-base

EXPOSE 8200 80 443

ENV VAULT_ADDR='http://127.0.0.1:8200'

# Install Vault
RUN	apt-get update \
	&& curl -L -s https://releases.hashicorp.com/vault/0.5.1/vault_0.5.1_linux_amd64.zip \
	   | gunzip -c > /usr/local/bin/vault \
	&& chmod +x /usr/local/bin/vault

# Copy the playbooks
COPY ansible /opt/ansible

# Install nginx and letsencrypt
RUN 	ansible-playbook /opt/ansible/nginx.yml \
	&& 	ansible-playbook /opt/ansible/letsencrypt.yml

COPY . /data

CMD ["vault", "server", "-config", "/data/vaultConfig.hcl"]

# From here you will want to log in and set up
# TLS credentials via let's encrypt, and set up the vault
