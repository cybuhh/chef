#
# Cookbook Name:: osx
# Recipe:: php
#
# Copyright 2013, cybuhh
#
packages = [
    "php54",
    "php54-gd",
    "php54-gettext",
    "php54-iconv",
    "php54-intl",
    "php54-ldap",
    "php54-mbstring",
    "php54-mcrypt",
    "php54-mysql",
    "php54-mysql",
    "php54-openssl",
    "php54-pcntl",
    "php54-pear",
    "php54-APC",
    "php54-Twig",
    "php54-html_parse",
    "php54-memcache",
    "php54-memcached",
    "php54-mongo",
    "php54-oauth",
    "php54-opcache",
    "php54-redis",
    "php54-xdebug",
    "php54-yaml"
].each do |package|
    macports_package package do
        action :install
    end
end