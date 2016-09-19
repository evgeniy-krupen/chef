require 'serverspec'
require 'net/ssh'
require 'tempfile'

set :backend, :ssh

describe port(22) do
  it { should be_listening }
end
# Disable sudo
# set :disable_sudo, true


# Set environment variables
# set :env, :LANG => 'C', :LC_MESSAGES => 'C'

# Set PATH
# set :path, '/sbin:/usr/local/sbin:$PATH'
