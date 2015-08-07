#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2013, cybuhh
#
[
    "php54",
    "php54-gettext",
    "php54-iconv",
    "php54-intl",
    "php54-mbstring",
    "php54-mcrypt",
    "php54-pcntl",
    "php54-pear",
    "php54-APC",
    "php54-opcache",
    "php54-gd",
].each do |package|
    package package do
        action :install
    end
end
