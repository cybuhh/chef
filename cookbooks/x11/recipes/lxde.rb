#
#
# Cookbook Name:: x11
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
