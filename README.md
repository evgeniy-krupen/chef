MTN.NIX.11 Automated environment configuration management
---

Task8


Student: [Evgeniy_Krupen](https://upsa.epam.com/workload/employeeView.do?employeeId=4060741400038655484#emplTab=general)


**1. I setup new VM by Vagrantfile**
**2. I installed chef-server by https://docs.chef.io/install_server.html**

$ sudo chef-server-ctl install chef-manage

$ sudo chef-server-ctl reconfigure

$ sudo chef-manage-ctl reconfigure

$ sudo chef-server-ctl user-create admin evgeniy krupen evgeniy_krupen@epam.com '123456' --filename 'user.pem'

$ chef-server-ctl org-create myorg 'krupen org' --association_user admin --filename 'myorg.pem'
![1](https://github.com/evgeniy-krupen/chef/blob/task8/task8/sources/1-1.png)

**3. I downloaded knife.rb from chef server, setup chef client on hostname and connected client to server**
![2](https://github.com/evgeniy-krupen/chef/blob/task8/task8/sources/1-2.png)

with very good link - https://www.digitalocean.com/community/tutorials/how-to-use-roles-and-environments-in-chef-to-control-server-configurations

**4. I upload cookboks to chef server**

$ knife cookbook upload --all

![3](https://github.com/evgeniy-krupen/chef/blob/task8/task8/sources/1-3.png)

**5. I modified jboss recipes**

[attributes](https://github.com/evgeniy-krupen/chef/blob/task8/task8/chef_cookbooks/jboss/attributes/default.rb)

[recipe](https://github.com/evgeniy-krupen/chef/blob/task8/task8/chef_cookbooks/jboss/recipes/default.rb)

[hudson template](https://github.com/evgeniy-krupen/chef/blob/task8/task8/chef_cookbooks/jboss/templates/default/hudson.erb)

**6.I created [environtment](https://github.com/evgeniy-krupen/chef/blob/task8/task8/environment.json), [role](https://github.com/evgeniy-krupen/chef/blob/task8/task8/role.json), [data bag](https://github.com/evgeniy-krupen/chef/blob/task8/task8/hudson.json)**

 I uploaded only json files from chef server because I did not understand how to download them from server
 
 ![8](https://github.com/evgeniy-krupen/chef/blob/task8/task8/sources/1-8.png)
 
 ![9](https://github.com/evgeniy-krupen/chef/blob/task8/task8/sources/1-9.png)

 ![11](https://github.com/evgeniy-krupen/chef/blob/task8/task8/sources/123.png)
 
 $ knife bootstrap 192.168.25.10 -N web2 -x root -P vagrant -r 'role[jboss_role]' -E 'Chef-env'
 
 Also check my [bootstrap.log](https://github.com/evgeniy-krupen/chef/blob/task8/task8/bootstrap.log)
 
 Thank you for your time.

 

