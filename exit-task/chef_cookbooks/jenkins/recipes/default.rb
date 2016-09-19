#
# Cookbook Name:: jenkins
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#

include_recipe "java"
include_recipe "tomcat"
include_recipe "nginx"

# install repo for jenkins
template "/etc/yum.repos.d/jenkins.repo" do
  source "jenkins_repo.erb"
  mode "0644"
  owner "root"
  group "root"
end

# install jenkins
package 'jenkins' do
  action :install
end

# install git for jobs
package 'git' do
  action :install
end

# copy config files for jenkins
template "/etc/sysconfig/jenkins" do
  source "jenkins_config.erb"
  mode "0644"
  owner "root"
  group "root"
  variables({
    'jenkins_port' => node['jenkins']['jenkins_port']
})
end

# copy all files for jenkins (jobs, plugins, maven settings)
remote_directory "/var/lib/jenkins" do
  source 'jenkins'
  owner 'jenkins'
  group 'jenkins'
  mode 0755
  action :create
  not_if { ::File.file?("/var/lib/jenkins/jobs/build/config.xml")}
end

# change chown for jenkins.home
execute 'jenkins_owner' do
  user 'root'
  command "chown -R jenkins.jenkins /var/lib/jenkins"
end

# add jenkins in tomcat group
group 'tomcat' do
  action :modify
  members 'jenkins'
  append true
end

# start jenkins
service "jenkins" do
  supports :restart => true, :start => true, :stop => true
  action [ :enable, :start ]
end
