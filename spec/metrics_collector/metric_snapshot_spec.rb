require "spec_helper"

describe MetricsCollector::MetricSnapshot do

  before do
    @snapshot = MetricsCollector::MetricSnapshot.new(:name, 1.0)
  end

  let(:snapshot) { @snapshot }

  it "has a name" do
    snapshot.name.should eq(:name)
  end

  it "has a value" do
    snapshot.value.should eq(1.0)
  end

  it "outputs as a formatted string" do
    snapshot.to_s.should eq("name: 1.0")
  end

end
