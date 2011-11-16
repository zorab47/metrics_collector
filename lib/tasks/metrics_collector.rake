namespace :metrics_collector do

  desc "Collect all defined metrics"
  task :collect => [:environment] do
    puts MetricsCollector::Collector.collect.inspect
  end

end
