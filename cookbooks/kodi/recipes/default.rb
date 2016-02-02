#
# Cookbook Name:: kodi
# Recipe:: kodi
#
# Copyright 2016, cybuhh
#
package "kodi" do
    action :install
end

template "/etc/default/kodi" do
    source "sites-available/#{configName}"
    mode 644
    owner 'root'
    group 'root'
    action :create
    backup 5
end
