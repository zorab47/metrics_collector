module MetricsCollector
  class Metric
    attr_accessor :name

    def initialize(name, &block)
      raise ArgumentError.new("Metric block is required") unless block_given?
      @block = block
      self.name = name
    end

    def evaluate
      @block.call
    end

    def snapshot
      MetricsCollector::MetricSnapshot.create(:name => name, :value => evaluate)
    end
  end
end
