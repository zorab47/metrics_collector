require "spec_helper"

describe MetricsCollector::Metric do
  subject do 
    MetricsCollector::Metric.new(:count) { 1.0 }
  end

  it "has a name" do
    subject.name.should eq(:count)
  end

  it "evaluates its proc contents" do
    subject.evaluate.should eq(1.0)
  end

  it "creates a snapshot" do
    MetricsCollector::MetricSnapshot.should_receive(:create).with(:name => :count, :value => 1.0)
    subject.snapshot
  end

  it "raises an argument error when no block is given" do
    expect { MetricsCollector::Metric.new(:name) }.to raise_error(ArgumentError)
  end
end
