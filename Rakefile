require 'bundler'
Bundler::GemHelper.install_tasks

require 'metrics_collector/tasks'

task :watchr do
  watchr_config = File.join(File.dirname(__FILE__), "watchr.rb")
  sh("bundle exec watchr #{watchr_config}")
end

task :environment do
  require 'metrics_collector'
  require 'spec/sample_app'
end
