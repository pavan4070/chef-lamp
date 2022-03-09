#
# Cookbook:: lamp
# Recipe:: web
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package "apache2" do
  action :install
end
service "apache2" do
  action [:enable, :start]
end

# Virtual Host Files

node["lamp"]["sites"].each do |sitename, data|
  document_root = "/var/www/html/#{sitename}"

  directory document_root do
    mode "0755"
    recursive true
  end

execute "enable-sites" do
    command "a2ensite #{sitename}"
    action :nothing
  end

template "/etc/apache2/sites-available/#{sitename}.conf" do
    source "virtualhosts.erb"
    mode "0644"
    variables(
      :document_root => document_root,
      :port => data["port"],
      :serveradmin => data["serveradmin"],
      :servername => data["servername"]
    )
notifies :run, "execute[enable-sites]"
    notifies :restart, "service[apache2]"
  end

  directory "/var/www/html/#{sitename}/public_html" do
    action :create
  end

  file '/var/www/html/example.com/index.html' do
  content "<html>
  <head>
    <title>Welcome to Example.com!</title>
  </head>
  <body>
    <h1>Success! The example.com virtual host is working!</h1>
  </body>
</html>"
  action :create
end

  file '/var/www/html/example.org/index.html' do
  content "<html>
  <head>
    <title>Welcome to Example.org!</title>
  </head>
  <body>
    <h1>Success! The example.org virtual host is working!</h1>
  </body>
</html>"
action :create
end

  directory "/var/www/html/#{sitename}/logs" do
    action :create
  end
#Apache Configuration

  execute "keepalive" do
    command "sed -i 's/KeepAlive On/KeepAlive Off/g' /etc/apache2/apache2.conf"
    action :run
  end

  execute "enable-prefork" do
    command "a2enmod mpm_prefork"
    action :nothing
  end

  cookbook_file "/etc/apache2/mods-available/mpm_prefork.conf" do
 source "mpm_prefork.conf"
    mode "0644"
    notifies :run, "execute[enable-prefork]"
  end
end


