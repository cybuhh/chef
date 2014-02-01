#
# Cookbook Name:: qs-stp
# Recipe:: flashplugin
#
# Copyright 2014, cybuhh
#
template "/etc/apt/sources.list.d/flashplugin.list" do
    source "flashplugin.list"
    mode 644
end

execute "apt_update" do
    command "apt-get update"
end

package "flashplugin-nonfree" do
    action :install
end
