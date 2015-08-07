#
# Cookbook Name:: ruby
# Recipe:: default
#
# Copyright 2014, cybuhh
#
[
	"rake",
    "ruby",
    "ruby-dev",
].each do |package|
    package package do
        action :install
    end
end
