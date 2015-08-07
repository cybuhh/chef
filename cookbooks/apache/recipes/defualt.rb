#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2014, cybuhh
#
[
    "apache2",
    "libapache2-mod-php5",
].each do |package|
    package package do
        action :install
    end
end

apacheConfigPath="/etc/apache2"
modulesAvailablePath = "#{apacheConfigPath}/mods-available"
modulesEnabledPath = "#{apacheConfigPath}/mods-enabled"
sitesAvailablePath = "#{apacheConfigPath}/sites-available"
sitesEnabledPath = "#{apacheConfigPath}/sites-enabled"

[
    "rewrite",
    "php5",
].each do |moduleName|
    ["load","conf"].each do |fileExt|
        link "#{modulesEnabledPath}/#{moduleName}.#{fileExt}" do
            to "#{modulesAvailablePath}/#{moduleName}.#{fileExt}"
            link_type :symbolic
            only_if "test -f #{modulesAvailablePath}/#{moduleName}.#{fileExt}"
        end
    end
end

[
    "default",
].each do |configName|
    template "#{sitesAvailablePath}/#{configName}" do
        source "sites-available/#{configName}"
        mode 644
        owner 'root'
        group 'root'
        action :create
        backup 5
    end

    link "#{sitesEnabledPath}/#{configName}" do
        to "#{sitesAvailablePath}/#{configName}"
        link_type :symbolic
        only_if "test -f #{sitesAvailablePath}/#{configName}"
    end
end

service "apache2" do
    action :restart
end
