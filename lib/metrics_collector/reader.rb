module MetricsCollector
  class Reader
    def initialize(collector = SingletonCollector.instance)
      @collector = collector
    end

    def define
      yield self if block_given?
    end

    def parse(metric_definitions)
      instance_eval(metric_definitions)
    end

    def metric(name, &block)
      @collector.monitor(Metric.new(self, name, &block))
    end
  end
end
