#
# Cookbook Name:: qs-stp
# Recipe:: x
#
# Copyright 2014, cybuhh
#

packages = [
    "lightdm",
    "lightdm-gtk-greeter",
    "xfce4",
    "chromium-browser",
].each do |package|
    package package do
        action :install
    end
end

template "/etc/lightdm/lightdm.conf" do
    source "lightdm.conf"
    mode 644
end

template "/home/#{node[:defaultUser]}/.config/autostart/chromium-autostart.desktop" do
	source "chromium-autostart.desktop"
    owner node[:defaultUser]
    group node[:defaultUser]
    mode 0644
    :create_if_missing
end

template "/etc/X11/default-display-manager" do
    source "default-display-manager"
    owner "root"
    group "root"
    mode 0644
    :create
end

execute "add_xsessionrc" do
    filePath = "/home/#{node[:defaultUser]}/.xsessionrc"
    fileContent = "startxfce4"
    command "grep '^#{fileContent}' #{filePath} || echo '#{fileContent}' >> #{filePath}"
    user node[:defaultUser]
end

service "lightdm" do
    action :restart
end
