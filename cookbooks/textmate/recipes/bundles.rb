#
# Cookbook Name:: textmate
# Recipe:: bundles
#
# Copyright 2013, cybuhh
#
installPath = "/Library/Application\ Support/TextMate/Bundles"

directory installPath do
    owner "root"
    group "root"
    mode 0755
    recursive true
    action :create
    not_if { ::File.exists?(installPath)}
end

subversion installPath do
    repository "http://svn.textmate.org/trunk/Bundles"
    revision "HEAD"
    destination "#{installPath}"
end

git "#{installPath}/ruby.tmbundle" do
  repository "git@github.com:textmate/ruby.tmbundle.git"
  reference "master"
  action :sync
end
