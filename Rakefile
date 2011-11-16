require 'bundler'
Bundler::GemHelper.install_tasks

load 'lib/tasks/metrics_collector.rake'

task :watchr do
  watchr_config = File.join(File.dirname(__FILE__), "watchr.rb")
  sh("bundle exec watchr #{watchr_config}")
end

task :environment do
  require 'lib/metrics_collector'
  require 'spec/sample_app'
end
