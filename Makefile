.PHONY: all install dependencies

all: deps install

install:
	ansible-playbook				\
		-i "localhost," 			\
		-c local				\
		--ask-become-pass			\
		./fedora-desktop-system.yaml

deps:
	sudo dnf groupinstall -by 'Development Tools'
	sudo dnf install -by	python2-dnf		\
				PyYAML			\
				libtomcrypt		\
				libtommath		\
				python-babel		\
				python-crypto		\
				python-ecdsa		\
				python-httplib2		\
				python-jinja2		\
				python-keyczar		\
				python-markupsafe	\
				python-paramiko		\
				python-pyasn1		\
				pytz			\
				sshpass

	pip install --user ansible
