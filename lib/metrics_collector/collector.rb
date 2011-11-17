require 'set'
require 'singleton'

module MetricsCollector
  class Collector
    attr_reader :metrics

    def initialize
      @metrics = Set.new
    end

    def monitor(metric)
      @metrics << metric
    end

    def clear
      @metrics.clear
    end

    def collect
      metrics.collect { |metric| metric.snapshot }
    end
  end

  class SingletonCollector < Collector
    include Singleton
  end
end
