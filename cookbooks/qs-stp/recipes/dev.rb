#
# Cookbook Name:: qs-stp
# Recipe:: dev
#
# Copyright 2014, cybuhh
#
[
    "apache2",
    "php5",
    "php5-curl",
    "php5-gd",
    "php5-intl",
    "php5-mysql",
].each do |package|
    package package do
        action :install
    end
end