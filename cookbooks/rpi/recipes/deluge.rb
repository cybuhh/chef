#
# Cookbook Name:: rpi
# Recipe:: deluge
#
# Copyright 2014, cybuhh
#
[
    "deluged",
    "deluge-console",
    "deluge-gtk",
].each do |packageName|
  package packageName do
    action :install
  end
end