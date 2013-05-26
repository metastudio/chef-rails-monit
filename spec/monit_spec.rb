require 'chefspec'

describe 'chef-rails-monitoring::monit' do
  let(:chef_run) { ChefSpec::ChefRunner.new.converge 'chef-rails-monitoring::monit' }

  it 'installs monit' do
    expect(chef_run).to install_package 'monit'
  end

  it 'restarts monit' do
    expect(chef_run).to restart_service 'monit'
  end

  it 'installs postfix' do
    expect(chef_run).to install_package 'postfix'
  end

  it 'includes conf.d' do
    expect(chef_run).to create_file_with_content '/etc/monit/monitrc', 'include /etc/monit/conf.d/*.conf'
  end
end
