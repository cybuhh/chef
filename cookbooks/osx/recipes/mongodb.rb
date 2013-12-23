#
# Cookbook Name:: osx
# Recipe:: mongodb
#
# Copyright 2013, cybuhh
#
macports_package "mongodb" do
    action :install
end

mongodbDbPath = "/data/db/"

directory mongodbDbPath do
    owner "root"
    group "root"
    mode 0755
    recursive true
    action :create
    not_if { ::File.exists?(mongodbDbPath)}
end