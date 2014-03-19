#
# Cookbook Name:: qs-stp
# Recipe:: x
#
# Copyright 2014, cybuhh
#
[
    "lightdm",
    "lightdm-gtk-greeter",
    "xfce4",
    "chromium-browser",
].each do |packageName|
    package packageName do
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
].each do |path|
    directory "/home/#{node[:defaultUser]}/#{path}" do
        mode 0755
        owner node[:defaultUser]
        group node[:defaultUser]
        action :create
    end
end

[
    "chromium-autostart.desktop",
    "screensaver-disable.desktop"
].each do |filename|
    template "/home/#{node[:defaultUser]}/.config/autostart/#{filename}" do
        source filename
        owner node[:defaultUser]
        group node[:defaultUser]
        mode 0644
        action :create_if_missing
    end
end

template "/etc/X11/default-display-manager" do
    source "default-display-manager"
    owner "root"
    group "root"
    mode 0644
    action :create
end

[
    "sleep 250 && xset s noblank ; xset s 0 0 ; xset s off"
].each do |fileContent|
    execute "add_xsessionrc" do
        filePath = "/home/#{node[:defaultUser]}/.xsessionrc"
        command "grep '^#{fileContent}' #{filePath} || echo '#{fileContent}' >> #{filePath}"
        user node[:defaultUser]
        action :nothing
    end
end

service "lightdm" do
    action :restart
end
