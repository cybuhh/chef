#!/bin/bash

if [ "$(id -u)" != "0" ]; then
	echo "Sorry, you are not root."
	exit 1
fi

function initDebian() {
    apt-get update
	apt-get dist-upgrade
	apt-get install sudo ssh rsync ruby ruby-dev
}

function initCentOS() {
	yum update
    yum install sudo ssh rsync ruby ruby-dev
}

if [ -f /etc/issue ]; then
	DISTRO=`cat /etc/issue | head -n 1| cut -f 1 -d " "`
else
	DISTRO=`uname -s`
fi

case "$DISTRO" in
	Debian|Ubuntu)
		initDebian
		;;
	CentOS)
		initCentOS
		;;
	*)
		echo "Sorry, I don't know how to init for '$DISTRO'."
		exit 1
		;;
esac

gem install knife-solo

mkdir -p -m 755 /var/chef
mkdir -p -m 755 /etc/chef

cat << EOF > /etc/chef/solo.rb
chef_repo_path "/var/chef"
cookbook_path "#{chef_repo_path}/cookbooks"
data_bag_path "#{chef_repo_path}/data_bags"
role_path "#{chef_repo_path}/roles"
environment_path "#{chef_repo_path}/environments”
EOF

