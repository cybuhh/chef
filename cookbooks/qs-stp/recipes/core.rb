#
# Cookbook Name:: qs-stp
# Recipe:: core
#
# Copyright 2014, cybuhh
#
packages = [
    "mc",
    "vim",
    "screen",
    "openvpn",
].each do |package|
    package package do
        action :install
    end
end