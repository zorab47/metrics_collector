class SampleApp
  extend MetricsCollector::ModelAdditions::ClassMethods

  @@counter = 0

  metric :time do
    Time.now
  end

  metric :counter do
    @@counter += 1
  end

  metric :disk_usage do
    dir = File.dirname(__FILE__)
    %x[du -s "#{dir}" | cut -f 1].chomp
  end
end
