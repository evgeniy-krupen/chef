#
# Cookbook Name:: jboss
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# install unzip

include_recipe 'java'

package 'unzip' do
  package_name 'unzip'
  action :install
end


# create jboss user

user node[:jboss][:jboss_user] do
  action :create
end

# download jboss from web

remote_file "#{node[:jboss][:tmp]}/#{node[:jboss][:jboss_zip]}" do
  source node[:jboss][:url]
  owner 'root'
  group 'root'
  mode 0755
  action :create
  not_if { ::File.file?("#{node[:jboss][:tmp]}/#{node[:jboss][:jboss_zip]}")}
end

#download app from web

remote_file "#{node[:jboss][:tmp]}/#{node[:jboss][:app_zip]}" do
  source node[:jboss][:app]
  owner 'root'
  group 'root'
  mode 0755
  action :create
  not_if { ::File.file?("#{node[:jboss][:tmp]}/#{node[:jboss][:app_zip]}")}
end

# extract jboss from zip to jboss_home

execute 'unzip_jboss' do
  user 'root'
  command "unzip -o #{node[:jboss][:tmp]}/#{node[:jboss][:jboss_zip]} -d #{node[:jboss][:jboss_home]}"
  action :run
  not_if { ::File.directory?("#{node[:jboss][:jboss_home]}/#{node[:jboss][:jboss_dir]}")}
end

# extract app to deploy folder

execute 'unzip_app' do
  user 'root'
  command "unzip -o #{node[:jboss][:tmp]}/#{node[:jboss][:app_zip]} -d #{node[:jboss][:jboss_home]}/#{node[:jboss][:jboss_dir]}/server/default/deploy/"
  action :run
  not_if { ::File.directory?("#{node[:jboss][:jboss_home]}/#{node[:jboss][:jboss_dir]}/server/default/deploy/testweb")}
end

# change user for jboss_jome

execute 'jboss_owner' do
  user 'root'
  command "chown -R #{node[:jboss][:jboss_user]}:#{node[:jboss][:jboss_user]} #{node[:jboss][:jboss_home]}/#{node[:jboss][:jboss_dir]} "
  action :run
end

# create init.d for jboss

template "/etc/init.d/jboss" do
  source "jboss.erb"
  mode "0755"
  owner "#{node[:jboss][:jboss_user]}"
  group "#{node[:jboss][:jboss_user]}"
  variables({
    :user => node[:jboss][:jboss_user],
    :home => node[:jboss][:jboss_home],
    :jboss_dir => node[:jboss][:jboss_dir]    
})
end

# start jboss
service "jboss" do
  supports :restart => true, :start => true, :stop => true
  action [ :enable, :start ]
end

