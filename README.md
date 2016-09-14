MTN.NIX.11 Automated environment configuration management
---

**TASK7**

Student: [Evgeniy_Krupen](https://upsa.epam.com/workload/employeeView.do?employeeId=4060741400038655484#emplTab=general)


1. I download CHEF & CHEF DK rmp files and put in VM.

2. I download Java cookbook from Opscode community. I used 
   - build init
   - build install
   - build packege
  
   and as artefact I got JAVA cookbook with all dependencies.

3. I prepared files solo.rb and runlist.json and copied them by Vagrantfile

4. I created new cookbok for jboss by 

   $ chef generate cookbook jboss

and I filled [attributes](https://github.com/evgeniy-krupen/chef/blob/task7/task7/chef_cookbooks/jboss/attributes/default.rb), [templates](https://github.com/evgeniy-krupen/chef/blob/task7/task7/chef_cookbooks/jboss/templates/default/jboss.erb), [recipe](https://github.com/evgeniy-krupen/chef/blob/task7/task7/chef_cookbooks/jboss/recipes/default.rb) in jboss cookbook.

5. When vagrant provision was finished, I connected to VM by ssh and run chef-solo:

   $ chef-solo -c /root/.chef/solo.rb > cheflog.log
