require "spec_helper"

describe MetricsCollector::Collector do
  subject { MetricsCollector::Collector }

  before do
    MetricsCollector::Collector.clear
  end

  it "adds classes to monitor" do
    subject.monitor(Project)
    subject.monitored_classes.should include(Project)
  end

  it "only adds a single entry of each class" do
    subject.monitor(Project)
    subject.monitor(Project)
    subject.monitored_classes.size.should eq(1)
  end
end
