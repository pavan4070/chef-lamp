# Chef InSpec test for recipe lamp::web
# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/
#unless os.windows?
 # This is an example test, replace with your own test.
# describe user('root'), :skip do
#  it { should exist }
# end
#end
# This is an example test, replace it with your own test.
describe package('apache2') do
 it { should be_installed }
end
describe port(80) do
 it { should be_listening }
end
