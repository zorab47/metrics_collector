module MetricsCollector
  module ModelAdditions
    module ClassMethods
      @@metrics = []

      def metric(name, &block)
        MetricsCollector::Collector.monitor(self)
        @@metrics << MetricsCollector::Metric.new(name, &block)
      end

      def metrics
        @@metrics
      end
    end
  end
end

#if defined? ActiveModel
#  ActiveModel.class_eval do
#    include MetricsCollector::ModelAdditions::ClassMethods
#  end
#end
