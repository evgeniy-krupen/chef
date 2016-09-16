MTN.NIX.11 Automated environment configuration management
---

**Task9**

Student: [Evgeniy_Krupen](https://upsa.epam.com/workload/employeeView.do?employeeId=4060741400038655484#emplTab=general)



**1. First of all I created new role for web resource**

$ knife cookbook create web

And described all commands which should be in providers

**2. I created cookbooks "web_nginx" as provider, added what provider should do**

the actual code in - web_nginx/provider/default.rb
recipe - web_nginx/recipe/default.rb
template for default page - web_nginx/templates/default/index.erb

**3. I created role for Nginx_web_server**

**4. I created cookbooks "web_apache" as provider like "web_nginx"**

the actual code in - web_apache/provider/default.rb
template for default page - web_apache/templates/default/index.erb
recipe - web_apache/recipe/default.rb


**5. I created role Apache_web_server**

**6. I made environment attribute "web_server_type" and recorded names of roles.**

**7. And bootstrap all roles**

$ knife bootstrap 192.168.25.10 -N web2 -x root -P vagrant -r 'role[Nginx_web_server]' -E 'Chef-env'

$ knife bootstrap 192.168.25.11 -N web3 -x root -P vagrant -r 'role[Apache_web_server]' -E 'Chef-env'

**8. Screenshots**

clean install:
![](https://github.com/evgeniy-krupen/chef/blob/task9/task9/source/nginx.png)
after "action :setup"

![](https://github.com/evgeniy-krupen/chef/blob/task9/task9/source/nginx-2.png)

![](https://github.com/evgeniy-krupen/chef/blob/task9/task9/source/apache.png)

![](https://github.com/evgeniy-krupen/chef/blob/task9/task9/source/apache2.png)

**9. As I have understand all logical chain:**

bootstrap + node + role + env => start recipe web with role check from env. attribute => start recipe web_nginx\web_appache =>
=> call resource web with actions from provider web_nginx\web_apache => run code from provider

in web I included dependencies

Thank you for your time.
