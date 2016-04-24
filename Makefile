.PHONY: all install dependencies

all: deps install

install:
	ansible-playbook -i "localhost," -c local ./fedora-desktop.yml

deps:
	sudo dnf groupinstall -by 'Development Tools'
	sudo dnf install -by ansible
	pip install --upgrade --user ansible
