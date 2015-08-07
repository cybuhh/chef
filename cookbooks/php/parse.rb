#
# Cookbook Name:: php
# Recipe:: parse
#
# Copyright 2014, cybuhh
#
[
    "php54-Twig",
    "php54-html_parse",
    "php54-yaml",
].each do |package|
    package package do
        action :install
    end
end
