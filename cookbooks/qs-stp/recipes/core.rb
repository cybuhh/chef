#
# Cookbook Name:: qs-stp
# Recipe:: core
#
# Copyright 2014, cybuhh
#
case node["platform"]
when "debian"
	template "/etc/apt/sources.list" do
	    source "sources.list"
	    mode 644
	    owner 'root'
	    group 'root'
	    backup 5
	end
when "ubuntu"
	
when "redhat", "centos", "fedora"

end

packages = [
    "mc",
    "vim",
    "screen",
    "openvpn",
].each do |package|
    package package do
        action :install
    end
end

user node[:defaultUser] do
	supports :manage_home => true
	comment "Default User"
	home "/home/#{node[:defaultUser]}"
	action :create
end