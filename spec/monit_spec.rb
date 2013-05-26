require 'chefspec'

describe 'chef-rails-monitoring::monit' do
  let(:chef_run) { ChefSpec::ChefRunner.new }
  let(:converge) { chef_run.converge 'chef-rails-monitoring::monit' }

  it 'installs monit' do
    expect(converge).to install_package 'monit'
  end

  it 'restarts monit' do
    expect(converge).to restart_service 'monit'
  end

  it 'installs postfix' do
    expect(converge).to include_recipe 'postfix::default'
  end

  it 'includes conf.d' do
    expect(converge).to create_file_with_content '/etc/monit/monitrc', 'include /etc/monit/conf.d/*.conf'
  end

  describe 'alerts' do
    it 'sets from email to node[:fqdn]' do
      chef_run.node.automatic_attrs[:fqdn] = 'example.com'
      expect(converge).to create_file_with_content '/etc/monit/monitrc', 'from: monit@example.com'
    end

    it 'sets receiver email to node[:monitoring][:email]' do
      chef_run.node.set[:monitoring][:email] = 'blah@meh.com'
      expect(converge).to create_file_with_content '/etc/monit/monitrc', /set alert\s+blah@meh.com/
    end
  end
end
