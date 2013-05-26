require 'chefspec'

describe 'chef-rails-monitoring::default' do
  let(:chef_run) { ChefSpec::ChefRunner.new.converge 'chef-rails-monitoring::default' }

  it 'includes monit' do
    expect(chef_run).to include_recipe 'chef-rails-monitoring::monit'
  end
end
