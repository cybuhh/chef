#
# Cookbook Name:: rpi
# Recipe:: xbmc
#
# Copyright 2013, cybuhh
#
template "/etc/apt/sources.list.d/xbmc.list" do
    source "xbmc.list"
    mode 644
end

execute "apt_key" do
    command "apt-key adv --keyserver keyserver.ubuntu.com --recv-key 5243CDED"
end

execute "apt_update" do
    command "apt-get update"
end

package "xbmc" do
    action :install
end
