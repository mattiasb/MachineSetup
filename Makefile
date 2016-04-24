.PHONY: all install dependencies

all: deps install

install:
	ansible-playbook -i "localhost," -c local ./fedora-desktop.yaml

deps:
	sudo dnf groupinstall -by 'Development Tools'
	sudo dnf install -by ansible python2-dnf
	pip install --upgrade --user ansible
