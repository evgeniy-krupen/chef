#
# Cookbook Name:: java
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


# install java from yum

package 'java-1.7.0-openjdk-devel' do
  action :install
end

# install unzip from yum
package 'unzip' do
  package_name 'unzip'
  action :install
end



