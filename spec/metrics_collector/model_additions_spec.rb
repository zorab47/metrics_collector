require "spec_helper"

describe MetricsCollector::ModelAdditions do
  it "can define metrics on models" do
    Project.should respond_to(:metric)
  end

  context "when defining a metric" do
    it "is added to the collector" do
      collector = double("collector")
      collector.should_receive(:monitor).with(an_instance_of(MetricsCollector::Metric))

      Project.class_eval do
        metric(:count, collector) do
          0.0
        end
      end

    end
  end
end
