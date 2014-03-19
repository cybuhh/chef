#
# Cookbook Name:: qs-stp
# Recipe:: dev
#
# Copyright 2014, cybuhh
#
[
	"memcached",
	"rake",
    "apache2",
    "php-pear",
    "php5",
    "php5-cli",
    "php5-common",
    "php5-curl",
    "php5-dev",
    "php5-gd",
    "php5-intl",
    "php5-memcache",
    "php5-memcached",
    "php5-mysql",
    "php5-xdebug",
].each do |package|
    package package do
        action :install
    end
end