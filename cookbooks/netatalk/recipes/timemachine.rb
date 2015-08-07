#
# Cookbook Name:: netatalk
# Recipe:: timemachine
#
# Copyright 2013, cybuhh
#
backupHome = "/mnt/backup"

package "netatalk" do
    action :install
end

execute "timemachine_config" do
    filePath = "/etc/netatalk/AppleVolumes.default"
    fileContent = "#{backupHome} \"Time Machine\" options:tm"
    command "grep '^#{fileContent}' #{filePath} || echo '#{fileContent}' >> #{filePath}"
end

service "netatalk" do
    action :restart
end
