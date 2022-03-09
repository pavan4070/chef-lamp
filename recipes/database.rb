#
# Cookbook:: lamp
# Recipe:: database
#
# Copyright:: 2017, The Authors, All Rights Reserved.

passwords = data_bag_item('passwords','mysql')

mysql_client 'default' do
	action :create
end

mysql_service 'default' do
    port '3306'
    version '8.0'
    bind_address '0.0.0.0'
    data_dir '/data'
    initial_root_password passwords['root_password']
    action [:create, :start]
end









