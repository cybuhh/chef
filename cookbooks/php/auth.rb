#
# Cookbook Name:: php
# Recipe:: auth
#
# Copyright 2014, cybuhh
#
[
    "php54-oauth",
    "php54-ldap",
    "php54-openssl",
].each do |package|
    package package do
        action :install
    end
end
