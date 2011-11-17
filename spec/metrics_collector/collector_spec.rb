require "spec_helper"

describe MetricsCollector::Collector do
  before do
    @collector = MetricsCollector::Collector.new
  end

  subject { @collector }

  it "adds metrics to monitor" do
    metric = double("metric")
    subject.monitor(metric)
    subject.metrics.should include(metric)
  end

  it "only adds a single entry of each metric" do
    metric = double("metric")
    subject.monitor(metric)
    subject.monitor(metric)
    subject.metrics.size.should eq(1)
  end

  context "with a metric" do
    before do
      @metric = double("metric")
      @collector.monitor(@metric)
    end

    it "clears all metrics" do
      subject.clear
      subject.metrics.should be_empty
    end

    it "collects metric snapshots" do
      snapshot = double("snapshot")
      @metric.should_receive(:snapshot).and_return(snapshot)
      subject.collect.should include(snapshot)
    end
  end
end

describe MetricsCollector::SingletonCollector do
  it "behaves like a singleton" do
    MetricsCollector::SingletonCollector.instance.should be(MetricsCollector::SingletonCollector.instance)
  end

  it "does not directly allow instanciation" do
    lambda { MetricsCollector::SingletonCollector.new }.should raise_error(NoMethodError)
  end
end
