#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


# install nginx from yum
package 'nginx' do
  action :install
end

# create config for nginx from template
template "/etc/nginx/conf.d/default.conf" do
  source "default.erb"
  mode "0755"
  variables({
    'nginx_port' => node['nginx']['nginx_port'],
    'jenkins_port' => node['nginx']['jenkins_port'],
    'tomcat_port' => node['nginx']['tomcat_port']
})
end


# nginx state start
service "nginx" do
  supports :restart => true, :start => true, :stop => true
  action [ :enable, :start ]
end
