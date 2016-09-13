MTN.NIX.11 Automated environment configuration management
---

Chef Introduction

Student: [Evgeniy_Krupen](https://upsa.epam.com/workload/employeeView.do?employeeId=4060741400038655484#emplTab=general)

Task6
---



**1. I setup vagrant box and install chef-solo:**

$ wget https://packages.chef.io/stable/el/6/chef-12.13.37-1.el6.x86_64.rpm

$ rpm -i chef-12.13.37-1.el6.x86_64.rpm

$ wget https://packages.chef.io/stable/el/6/chefdk-0.17.17-1.el6.x86_64.rpm

$ rpm -i chefdk-0.17.17-1.el6.x86_64.rpm

![!](https://github.com/evgeniy-krupen/chef/blob/task6/task6/sources/install-chef.png)
![!](https://github.com/evgeniy-krupen/chef/blob/task6/task6/sources/install-chefDK.png)
![!](https://github.com/evgeniy-krupen/chef/blob/task6/task6/sources/chef-version.png)

**2. I created ~/.chef/solo.rb file with context:**

log_level :debug
file_cache_path "/root/.chef/"
cookbook_path "/root/chef_cookbooks"
json_attribs "/root/.chef/runlist.json"

Also I created runlist.json file (will come back to it later)

**3. I downloaded cookboks from http://community.opscode.com/cookbooks/ for nginx and iptables. Then I saw in metadata.rb and realized that nginx has dependencies. I used berkshelf for solve this issue:**

$ cd /root/chef_cookbooks/nginx

$ berks init

$ yum install git

$ berks init (again)

$ berks install

$ berks packege


As output I got artefact with all dependencies. I extracted it in /root/chef_cookbooks.

**4. I created runlist.json in [/root/.chef/runlist.json] (https://github.com/evgeniy-krupen/chef/blob/task6/task6/runlist.json):**

{ 
"run_list": ["recipe[nginx::default]", "recipe[iptables::default]"],
  "nginx": {"default_root":"/usr/share/nginx/html"} 
}

**5. I run chef-solo after all steps (with logging)**

$ chef-solo -c [/root/.chef/solo.rb](https://github.com/evgeniy-krupen/chef/blob/task6/task6/solo.rb) > [cheflog.log](https://github.com/evgeniy-krupen/chef/blob/task6/task6/cheflog.log)

**6. I checked nginx and iptables**

Nginx:

![](https://github.com/evgeniy-krupen/chef/blob/task6/task6/sources/nginx_local.png)
![](https://github.com/evgeniy-krupen/chef/blob/task6/task6/sources/nginx_from_host.png)

Iptables:

![](https://github.com/evgeniy-krupen/chef/blob/task6/task6/sources/iptables_after.png)

Please, checkout my [cookbooks](https://github.com/evgeniy-krupen/chef/tree/task6/task6/chef_cookbooks)
