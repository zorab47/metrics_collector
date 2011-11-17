require "spec_helper"

describe MetricsCollector::Reader do
  before do
    @collector = MetricsCollector::Collector.new
  end

  let(:reader) { MetricsCollector::Reader.new(@collector) }

  it "parses a metric definition" do
    reader.parse %{
      metric :count do
        1.0
      end
    }

    @collector.metrics.should_not be_empty
    @collector.metrics.first.name.should == :count
  end

  context "defining metrics via block" do
    it "parses a block definition" do
      reader.define do |app|
        app.metric :count do
          1.0
        end
      end

      @collector.metrics.should_not be_empty
      @collector.metrics.first.name.should == :count
    end

    it "does nothing without block" do
      lambda { reader.define }.should_not raise_error
    end
  end
end
