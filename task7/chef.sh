#! /bin/bash
# this is script for CHEF VM

yum install -y git
# install chef (I put rpm files in vagrant source)
rpm -i /vagrant/sources/chef-12.13.37-1.el6.x86_64.rpm
rpm -i /vagrant/sources/chefdk-0.17.17-1.el6.x86_64.rpm

# copy file for chef-solo & cookbooks (I copied ready cookbooks)
cp -rf /vagrant/sources/.chef/ /root/
cp -rf /vagrant/sources/chef_cookbooks/ /root/



