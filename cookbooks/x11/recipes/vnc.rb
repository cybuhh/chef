#
# Cookbook Name:: x11
# Recipe:: vnc
#
# Copyright 2014, cybuhh
#
package "x11vnc" do
    action :install
end

directory "/home/#{node[:default_user]}/.vnc" do
    owner node[:default_user]
    group node[:default_user]
    mode 0700
    action :create
end

execute "store_password" do
    passwd = "x11vnc"
    command "x11vnc -storepasswd #{passwd} /home/#{node[:default_user]}/.vnc/passwd"
    user node[:default_user]
    notifies :run, "execute[add_xsessionrc]"
end

execute "add_xsessionrc" do
    filePath = "/home/#{node[:default_user]}/.xsessionrc"
    fileContent = "x11vnc -display :0 -noipv6 -forever -usepw &"
    command "grep '^#{fileContent}' #{filePath} || echo '#{fileContent}' >> #{filePath}"
    user node[:default_user]
    action :nothing
end
