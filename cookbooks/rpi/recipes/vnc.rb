#
# Cookbook Name:: rpi
# Recipe:: vnc
#
# Copyright 2013, cybuhh
#
apt_package "x11vnc" do
    action :install
end

execute "store_password" do
    pass = STDIN.gets.chomp
    command "x11vnc -storepasswd #{pass}"
    actoin :nothing
end

execute "store_password" do
    filePath = "/home/pi/.xsessionrc"
    fileContent = "x11vnc -display :0 -noipv6 -forever -usepw &"
    command "grep '^#{fileContent}' #{filePath} || echo '#{fileContent}' >> #{filePath}"
end
