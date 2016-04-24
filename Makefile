.PHONY: all install dependencies

all: deps install

install:
	ansible-playbook -i "localhost," -c local fedora-desktop.yml

deps:
	sudo dnf groupinstall 'Development Tools'
	sudo dnf install python-pip python-dnf
	pip install --user ansible
