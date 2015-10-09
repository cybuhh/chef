#
# Cookbook Name:: mongodb
# Recipe:: default
#
# Copyright 2013, cybuhh
#
package "mongodb" do
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
