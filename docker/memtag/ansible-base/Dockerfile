# A base ubuntu image with ansible installed

FROM ubuntu

VOLUME /data

RUN apt-get update \
	&& apt-get install -y curl nano python git

# Install Ansible
RUN apt-get install -y software-properties-common \
	&& apt-add-repository ppa:ansible/ansible \
	&& apt-get update \
	&& apt-get install -y ansible

