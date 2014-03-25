#
#
# Cookbook Name:: qs-stp
# Recipe:: lxde
#
# Copyright 2014, cybuhh
#
[
    "lxde",
].each do |packageName|
    package packageName do
        action :install
    end
end

template "/home/#{node[:defaultUser]}/.dmrc" do
    source "dmrc"
    mode 0644
    owner node[:defaultUser]
    group node[:defaultUser]
    action :create
end
