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
    subject.snapshot.should == { :count => 1.0 }
  end

  it "raises an argument error when no block is given" do
    expect { MetricsCollector::Metric.new(:name) }.to raise_error(ArgumentError)
  end
end
