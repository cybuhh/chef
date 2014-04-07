#
#
# Cookbook Name:: qs-stp
# Recipe:: xfce4
#
# Copyright 2014, cybuhh
#
[
    "xfce4",
    "xfce4-session",
    "xfce4-settings",
    "xfwm4"
].each do |packageName|
    package packageName do
        action :install
    end
end
