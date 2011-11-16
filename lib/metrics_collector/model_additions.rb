module MetricsCollector
  module ModelAdditions
    module ClassMethods
      @@metrics = Hash.new

      def metric(name, &block)
        MetricsCollector::Collector.monitor(self)
        @@metrics[name] = MetricsCollector::Metric.new(name, &block)
      end

      def metrics
        @@metrics
      end
    end
  end
end
