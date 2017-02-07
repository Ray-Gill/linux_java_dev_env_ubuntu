#!/bin/bash

set -e
set -o pipefail

# Set the PATH variables, Ansible will add to this for applications needed onto PATH
echo "PATH=$PATH" > /etc/environment

## OS SPECIFIC: change this for different distro
echo "Add Ansible APT"
apt-add-repository ppa:ansible/ansible
#apt-get -y update
apt-get -y install ansible
echo "Install Ansible"
## END OS SPECIFIC

echo "Run Ansible playbook"
ansible-playbook /home/vagrant/share/scripts/ansible/playbook/setupDev.yml

echo "refresh profile"
source /etc/profile

echo "refresh /etc/environment"
. /etc/environment