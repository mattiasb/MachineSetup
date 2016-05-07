.PHONY: all install user-install system-install

all: install

ANSIBLE=/usr/bin/ansible

$(ANSIBLE):
	sudo dnf install -by ansible

install: system user

system-install: $(ANSIBLE)
	ansible-playbook -i "localhost," -c local --ask-become-pass ./fedora-desktop-system.yaml

user-install: $(ANSIBLE)
	ansible-playbook -i "localhost," -c local ./fedora-desktop-user.yaml
