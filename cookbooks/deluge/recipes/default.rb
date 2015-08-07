#
# Cookbook Name:: deluge
# Recipe:: default
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
