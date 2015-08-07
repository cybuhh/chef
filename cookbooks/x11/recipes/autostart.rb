#
#
# Cookbook Name:: x11
# Recipe:: autostart
#
# Copyright 2014, cybuhh
#
[
    ".config",
    ".config/autostart",
].each do |path|
    directory "/home/#{node[:default_user]}/#{path}" do
        mode 0755
        owner node[:default_user]
        group node[:default_user]
        action :create
    end
end

[
    "chromium-autostart.desktop",
    "screensaver-disable.desktop"
].each do |filename|
    template "/home/#{node[:default_user]}/.config/autostart/#{filename}" do
        source filename
        owner node[:default_user]
        group node[:default_user]
        mode 0644
        action :create_if_missing
    end
end
