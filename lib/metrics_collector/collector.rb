module MetricsCollector
  class Collector < ActiveRecord::Base
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
  end
end
