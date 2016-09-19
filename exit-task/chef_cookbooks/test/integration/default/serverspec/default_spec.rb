
require 'serverspec'
set :backend, :exec

# test 22 port
describe port('22') do
  it { should be_listening }
end

# check jenkins running
describe service('jenkins') do
    it { should be_enabled }
    it { should be_running }
end

#check oinstalled tools
describe package('java') do
  it { should be_installed }
end

describe package('tomcat') do
  it { should be_installed }
end

describe package('nginx') do
  it { should be_installed }
end

describe package('jenkins') do
  it { should be_installed }
end
