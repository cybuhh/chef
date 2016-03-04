#
# Cookbook Name:: deluge
# Recipe:: default
#
# Copyright 2014, cybuhh
#
[
    "deluged",
    "deluge-console",
    "deluge-gtk",
].each do |packageName|
  package packageName do
    action :install
  end
end

cookbook_file "/home/#{node[:default_user]}/.config/deluge/core.conf" do
    source "core.conf"
    mode 0644
    owner node[:default_user]
    group node[:default_user]
    action :create
    backup 1
    notifies :run, "execute[replace_placeholders]"
end

execute "replace_placeholders" do
    file_path = "/home/#{node[:default_user]}/.config/deluge/core.conf"
    command "sed -i -e 's/__USER__/#{node[:default_user]}/g' #{file_path}"
    action :nothing
end
