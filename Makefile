.PHONY: all install user-install system-install

all: install

ANSIBLE=/usr/bin/ansible
PYTHON_DNF=/usr/lib/python2.7/site-packages/dnf

$(PYTHON_DNF):
	sudo dnf install -by python2-dnf

$(ANSIBLE):
	sudo dnf install -by ansible

install: system-install user-install

system-install: $(ANSIBLE) $(PYTHON_DNF)
	ansible-playbook -i "localhost," -c local --ask-become-pass ./fedora-desktop-system.yaml

user-install: $(ANSIBLE)
	ansible-playbook -i "localhost," -c local ./fedora-desktop-user.yaml
