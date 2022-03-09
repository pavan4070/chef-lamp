#
# Cookbook:: lamp
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# this is a comment

apt_update 'daily' do
  frequency 86_400
  action :periodic
end

apache2_install 'default_install'

apache2_site '000-default' do
  action :disable
end

apache2_default_site '' do
  action :enable
end

service 'apache2' do
  service_name lazy { apache_platform_service_name }
  supports restart: true, status: true, reload: true
  action :nothing
end

include_recipe 'lamp::web'
include_recipe 'lamp::database'
include_recipe 'lamp::php'
include_recipe 'lamp::phpmyadmin'
