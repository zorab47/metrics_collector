require 'bundler'
Bundler::GemHelper.install_tasks

task :watchr do
  watchr_config = File.join(File.dirname(__FILE__), "watchr.rb")
  sh("bundle exec watchr #{watchr_config}")
end
