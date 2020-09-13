#!/bin/bash

set -e

URL=https://github.com/mattiasb/MachineSetup.git
BRANCH=master
REPO_DIR="/tmp/MachineSetup"

# Install ansible
sudo dnf install -y ansible

# Clone the code
if [ ! -d "${REPO_DIR}" ]; then
    mkdir -p "$(dirname "${REPO_DIR}")"
    git clone --branch "${BRANCH}" "${URL}" "${REPO_DIR}"
fi
cd "${REPO_DIR}"
git branch --set-upstream-to="origin/${BRANCH}" "${BRANCH}"
git config user.name "Mattias Bengtsson"
git config user.email "mattias.jc.bengtsson@gmail.com"
git pull --rebase

# Set hostname
# TODO: Move this to Ansible
if [[ "$(systemd-detect-virt)" == kvm ]]; then
    sudo hostnamectl set-hostname machinesetup-test
    sudo dnf install -y openssh-server
    sudo systemctl enable --now sshd
    sudo systemctl restart avahi-daemon
else
    case "$(sudo cat /sys/devices/virtual/dmi/id/product_uuid)" in
        4c4c4544-0054-4e10-8043-c7c04f565a31)
            sudo hostnamectl set-hostname mattiasb-dell-E6540
            ;;
        4c4c4544-0043-4c10-8042-c8c04f4a4332)
            sudo hostnamectl set-hostname mattiasb-dell-ES470
            ;;
        1afaa71f-393e-11e8-9379-8c164560bb35)
            sudo hostnamectl set-hostname mattiasb-lenovo-yoga920
            ;;

        *)
            echo Unknown hardware!
            exit 3
    esac
fi

./site.yml -v -K
