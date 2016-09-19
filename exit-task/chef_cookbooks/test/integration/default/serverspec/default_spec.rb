
require 'serverspec'
set :backend, :exec

# test 22 port
describe port('22') do
  it { should be_listening }
end

describe service('jenkins') do
    it { should be_enabled }
    it { should be_running }
end
