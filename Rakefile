require 'rubygems'
require 'bundler'

require 'foodcritic'
FoodCritic::Rake::LintTask.new

Bundler.setup


task default: [
  :foodcritic,
  :berks,
  :knife,
  :chefspec
]

desc 'Installs dependencies'
task :berks do
  sh 'rm -rf vendor/cookbooks'
  sh 'bundle exec berks install --path vendor/cookbooks'
end

desc 'Validates cookbook'
task :knife do
  sh 'bundle exec knife cookbook test chef-rails-monitoring -o vendor/cookbooks'
end

desc 'Executes specs'
task :chefspec do
  sh %{bundle exec rspec spec/}
end
