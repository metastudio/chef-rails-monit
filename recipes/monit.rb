include_recipe 'postfix::default'

package "monit"

template "/etc/monit/monitrc" do
  source "monitrc.erb"
end

service "monit" do
  supports reload: true, restart: true
  action [:enable, :restart]
end
