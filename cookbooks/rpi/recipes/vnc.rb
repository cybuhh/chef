#
# Cookbook Name:: rpi
# Recipe:: vnc
#
# Copyright 2013, cybuhh
#
package "x11vnc" do
    action :install
end

directory "/home/pi/.vnc" do
    owner "pi"
    group "pi"
    mode 0700
    action :create
end

execute "store_password" do
    passwd = "x11vnc"
    command "x11vnc -storepasswd #{passwd} /home/pi/.vnc/passwd"
    user "pi"
end

execute "add_xsessionrc" do
    filePath = "/home/pi/.xsessionrc"
    fileContent = "x11vnc -display :0 -noipv6 -forever -usepw &"
    command "grep '^#{fileContent}' #{filePath} || echo '#{fileContent}' >> #{filePath}"
    user "pi"
end
