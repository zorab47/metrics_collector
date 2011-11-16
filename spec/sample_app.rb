class SampleApp
  extend MetricsCollector::ModelAdditions::ClassMethods

  @@counter = 0

  metric :time do
    Time.now
  end

  metric :counter do
    @@counter += 1
  end

end
