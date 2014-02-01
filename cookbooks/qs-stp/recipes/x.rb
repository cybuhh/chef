#
# Cookbook Name:: qs-stp
# Recipe:: x
#
# Copyright 2014, cybuhh
#

packages = [
    "lightdm",
    "xfce4",
    "chromium",  
].each do |package|
    package package do
        action :install
    end
end

template "/etc/lightdm/lightdm.conf" do
    source "lightdm.conf"
    mode 644
end

[
    ".config",
    ".config/autostart",
    ".config/xfce4",
    ".config/xfce4/desktop",
].each do |tplPath|
    directory "/home/#{node[:defaultUser]}/#{tplPath}" do
        owner node[:defaultUser]
        group node[:defaultUser]
        mode 0755
        recursive true
        action :create
    end
end

template "/home/#{node[:defaultUser]}/.config/autostart/chromium-autostart.desktop" do
	source "chromium-autostart.desktop"
    owner node[:defaultUser]
    group node[:defaultUser]
    mode 0644
    :create
end

service "lightdm" do
    action :restart
end