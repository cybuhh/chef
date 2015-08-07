#
# Cookbook Name:: qs-stp
# Recipe:: core
#
# Copyright 2014, cybuhh
#
user node[:default_user] do
	supports :manage_home => true
	comment "Default User"
	home "/home/#{node[:default_user]}"
	action :create
    not_if node[:default_user].nil?
end
