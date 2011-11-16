module MetricsCollector
  class Metric

    # Public: The Symbol name of this metric
    attr_accessor :name

    # Public: The Class or Object who created this metric
    attr_accessor :creator

    def initialize(creator, name, &block)
      raise ArgumentError.new("Metric block is required") unless block_given?
      @block = block
      self.name = name
      self.creator = creator
    end

    # Public: Evaluates the metric defined.
    #
    # Returns the metric's value.
    def evaluate
      @block.call
    end

    # Builds a Snapshot to be persisted.
    #
    # Returns the Snapshot.
    def snapshot
      MetricSnapshot.new(name, evaluate)
    end
  end
end
