require 'chefspec'

describe 'chef-rails-monit::default' do
  let(:chef_run) { ChefSpec::ChefRunner.new.converge 'chef-rails-monit::default' }

  it 'includes monit' do
    expect(chef_run).to include_recipe 'chef-rails-monit::monit'
  end
end
