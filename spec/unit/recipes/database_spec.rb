#
# Cookbook:: lamp
# Spec:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'lamp::database' do

let(:installation_client_package_ubuntu_2004) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '20.04') }

context 'using ubuntu 20.04' do
    it 'installs mysql_client_installation_package[default] when version is 8.0.28-0' do
      installation_client_package_ubuntu_2004.node.default['mysql_test']['version'] = '8.0.28-0'
      installation_client_package_ubuntu_2004.converge(described_recipe)
      expect(installation_client_package_ubuntu_2004).to create_mysql_client_installation_package('default').with(
        version: '8.0.28-0',
        package_name: ['mysql-client-0.20.04.3', 'libmysqlclient-dev']
      )
    end
  end
end
