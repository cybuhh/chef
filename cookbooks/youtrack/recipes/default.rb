#
# Cookbook Name:: youtrack
# Recipe:: default
#
# Copyright 2014, cybuhh
#
version="6.0.12577"

directory node[:install_path] do
    owner 'root'
    group 'root'
    action :create
end

remote_file "/usr/local/lib/youtrack/youtrack-#{version}.jar" do
    source "https://download.jetbrains.com/charisma/youtrack-#{version}.jar"
end

template "/etc/init.d/youtrack" do
    mode    "0755"
    source "youtrack.erb"
end
