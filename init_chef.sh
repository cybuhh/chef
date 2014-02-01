#!/bin/bash

if [ "$(id -u)" != "0" ]; then
	echo "Sorry, you are not root."
	exit 1
fi

apt-get update
apt-get dist-upgrade
apt-get install ssh rsync ruby ruby-dev
gem install knife-solo

sudo mkdir -p -m 755 /var/chef
sudo mkdir -p -m 755 /etc/chef

cat << EOF > /etc/chef/solo.rb
chef_repo_path "/var/chef"
cookbook_path "#{chef_repo_path}/cookbooks"
data_bag_path "#{chef_repo_path}/data_bags"
role_path "#{chef_repo_path}/roles"
environment_path "#{chef_repo_path}/environments”
EOF
