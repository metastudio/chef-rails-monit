class MonitTest < MiniTest::Chef::Spec
  describe_recipe 'chef-rails-monitoring::monit' do
    describe 'monit' do
      it 'installed' do
        package('monit').must_be_installed
      end

      it 'starts' do
        service('monit').must_be_running
      end

      it 'enabled' do
        service('monit').must_be_enabled
      end

      it 'includes sub-configuration' do
        file('/etc/monit/monitrc').must_include 'include /etc/monit/conf.d/*.conf'
      end
    end

    describe 'postfix' do
      it 'installed' do
        package('postfix').must_be_installed
      end

      it 'starts' do
        service('postfix').must_be_running
      end

      it 'enabled' do
        service('postfix').must_be_enabled
      end
    end
  end
end
