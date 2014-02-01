#
# Cookbook Name:: qs-stp
# Recipe:: x
#
# Copyright 2014, cybuhh
#

packages = [
    "lightdm",
    "xfce4",
    "chromium",  
].each do |package|
    package package do
        action :install
    end
end

template "/etc/lightdm/lightdm.conf" do
    source "lightdm.conf"
    mode 644
end

[
    ".config",
    ".config/xfce4",
    ".config/xfce4/desktop",
    ".config/xfce4/xfconf",
    ".config/xfce4/xfconf/xfce-perchannel-xml",
    ".config/xfce4/panel",
    ".config/xfce4/panel/launcher-9",
    ".config/xfce4/panel/launcher-10",
    ".config/xfce4/panel/launcher-11",
    ".config/xfce4/panel/launcher-12",
].each do |tplPath|
    directory "/home/#{node[:defaultUser]}/#{tplPath}" do
        owner node[:defaultUser]
        group node[:defaultUser]
        mode 0755
        recursive true
        action :create
    end
end

{
    "desktop" => "icons.screen0.rc",
    "xfconf/xfce-perchannel-xml" => "xfce4-mixer.xml",
    "xfconf/xfce-perchannel-xml" => "xfce4-panel.xml",
    "xfconf/xfce-perchannel-xml" => "xsettings.xml",
    "xfconf/xfce-perchannel-xml" => "xfwm4.xml",
    "panel/launcher-9" => "13912645871.desktop",
    "panel/launcher-10" => "13912645882.desktop",
    "panel/launcher-11" => "13912645883.desktop",
    "panel/launcher-12" => "13912645884.desktop"
}.each_pair do |tplPath, tplFile| 

#	directory "/home/#{node[:defaultUser]}/.config/xfce4/#{tplPath}" do
#	    owner node[:defaultUser]
#	    group node[:defaultUser]
#	    mode 0755
#	    recursive true
#	    action :create
#	end

	template "/home/#{node[:defaultUser]}/.config/xfce4/#{tplPath}/#{tplFile}" do
    	source "xfce4/#{tplPath}/#{tplFile}"
	    owner node[:defaultUser]
	    group node[:defaultUser]
	    mode 0644
        :create
    end
end
