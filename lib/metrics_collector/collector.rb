module MetricsCollector
  class Collector
    @@monitored_classes = Set.new

    def self.monitor(klass)
      @@monitored_classes << klass
    end

    def self.monitored_classes
      @@monitored_classes
    end

    def self.clear
      @@monitored_classes = Set.new
    end

    def self.collect
      monitored_classes.collect { |klass| klass.metrics.values }.flatten.collect { |metric| metric.snapshot}
    end
  end
end
