namespace :metrics_collector do

  desc "Collect all defined metrics"
  task :collect => [:environment] do
    snapshots = MetricsCollector::SingletonCollector.instance.collect
    puts snapshots.collect(&:to_s)
  end

end
