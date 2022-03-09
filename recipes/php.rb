# install php.
package "php" do
    action :install
end
package "php-pear" do
    action :install
end
package 'libapache2-mod-php' do
  action :install
  notifies :restart, "service[apache2]"
end
# Install php-mysql.
package 'php-mysql' do
    action :install
    notifies :restart, "service[apache2]"
end
