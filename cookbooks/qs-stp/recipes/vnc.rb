#
# Cookbook Name:: qs-stp
# Recipe:: vnc
#
# Copyright 2014, cybuhh
#
package "x11vnc" do
    action :install
end

directory "/home/#{node[:defaultUser]}/.vnc" do
    owner node[:defaultUser]
    group node[:defaultUser]
    mode 0700
    action :create
end

execute "store_password" do
    passwd = "x11vnc"
    command "x11vnc -storepasswd #{passwd} /home/#{node[:defaultUser]}/.vnc/passwd"
    user node[:defaultUser]
end

execute "add_xsessionrc" do
    filePath = "/home/#{node[:defaultUser]}/.xsessionrc"
    fileContent = "x11vnc -display :0 -noipv6 -forever -usepw &"
    command "grep '^#{fileContent}' #{filePath} || echo '#{fileContent}' >> #{filePath}"
    user node[:defaultUser]
end
