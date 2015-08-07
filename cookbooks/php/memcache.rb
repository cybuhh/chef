#
# Cookbook Name:: ruby
# Recipe:: memcache
#
# Copyright 2014, cybuhh
#
[
    "php5-memcache",
    "php5-memcached",
].each do |package|
    package package do
        action :install
    end
end
