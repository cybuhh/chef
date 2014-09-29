#
# Cookbook Name:: core
# Recipe:: default
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
		    action :create
		    backup 5
		    notifies :run, "execute[apt_get_update]"
		end

	when "ubuntu"
		
	when "redhat", "centos", "fedora"

end

execute "apt_get_update" do
	command "apt-get autoclean && apt-get update"
	action :nothing
end

[
    "mc",
    "vim",
    "screen"
].each do |package|
    package package do
        action :install
    end
end
