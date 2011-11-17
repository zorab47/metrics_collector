module MetricsCollector
  module ModelAdditions
    module ClassMethods
      def metric(name, collector = MetricsCollector::SingletonCollector.instance, &block)
        collector.monitor(MetricsCollector::Metric.new(self, name, &block))
      end
    end
  end
end
