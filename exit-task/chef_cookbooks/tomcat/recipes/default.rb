#
  #ckage 'nginx' do
  #  action :install
  #  end t: 
# Cookbook Name:: tomcat
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
#
package 'tomcat' do
  action :install
end

package 'tomcat-webapps' do
  action :install
end

template "/etc/tomcat/server.xml" do
	source "default.erb"
        mode "0755"
	variables({
		"tomcat_port" => node["tomcat"]["tomcat_port"]
		})
end


service "tomcat" do
  supports :restart => true, :start => true, :stop => true, :status => false
  action [ :enable, :start ]
end
