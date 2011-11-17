require "spec_helper"

describe MetricsCollector::Metric do
  before do
    @creator = mock("creator")
  end

  let(:metric) do
    MetricsCollector::Metric.new(@creator, :count) { 1.0 }
  end

  it "has an creator" do
    metric.creator.should == @creator
  end

  it "has a name" do
    metric.name.should == :count
  end

  it "evaluates its proc contents" do
    metric.evaluate.should == 1.0
  end

  it "raises an argument error when no block is given" do
    expect { MetricsCollector::Metric.new(nil, :name) }.to raise_error(ArgumentError)
  end

  context "when taking a snapshot" do

    subject { metric.snapshot }

    it "creates a snapshot" do
      subject.should be_a(MetricsCollector::MetricSnapshot)
    end

    it "sets the name" do
      subject.name.should == :count
    end

    it "sets the value" do
      subject.value.should == 1.0
    end
  end

end
