MTN.NIX.11 Automated environment configuration management
---

Exit Task

Student: [Evgeniy_Krupen](https://upsa.epam.com/workload/employeeView.do?employeeId=4060741400038655484#emplTab=general)

**1. 1. I created java [cookbook](https://github.com/evgeniy-krupen/chef/blob/exittask/exit-task/chef_cookbooks/java/recipes/default.rb) with resource package**

**2. I created nginx [cookbook](https://github.com/evgeniy-krupen/chef/blob/exittask/exit-task/chef_cookbooks/nginx/recipes/default.rb) with [attributes](https://github.com/evgeniy-krupen/chef/blob/exittask/exit-task/chef_cookbooks/nginx/attributes/default.rb). I used [template](https://github.com/evgeniy-krupen/chef/blob/exittask/exit-task/chef_cookbooks/nginx/templates/default/default.erb) for default config nginx**


**3. I created tomcat [cookbook](https://github.com/evgeniy-krupen/chef/blob/exittask/exit-task/chef_cookbooks/tomcat/recipes/default.rb) (install tomcat, tomcat-webapps) with [template](https://github.com/evgeniy-krupen/chef/blob/exittask/exit-task/chef_cookbooks/tomcat/templates/default/default.erb) and [attribute](https://github.com/evgeniy-krupen/chef/blob/exittask/exit-task/chef_cookbooks/tomcat/attributes/default.rb)**

**4. I created jenkins cookbook (install jenkins-repo, jenkins, git, templates)**

I bootstrap all my cookbook on 1 VM by:

knife bootstrap 192.168.25.10 -N web2 -x root -P vagrant -r 'role[exittask]' -E 'Chef-env'



5. I used foodcritic, checked my cookbook and fixed all bugs

gem install foodcritic

6. I read articles on chef test but i did not understand how it works

I used:
gem install test-kitchen
gem install yard-chef
gem install ripper
gem install serverspec

I created test/integration/default/serverspec/default_spec.rb
with testing 22 port and tools



