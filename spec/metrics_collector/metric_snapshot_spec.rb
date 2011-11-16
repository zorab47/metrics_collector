require "spec_helper"

describe MetricsCollector::MetricSnapshot do
  before(:all) do
    MetricsCollector::Collector.clear

    Project.metrics.clear

    class Project
      @@count = 0

      metric :counter do
        @@count += 1
      end

      def self.reset
        @@count = 0
      end
    end
  end

  context "with a class monitored" do
    before(:each) do
      Project.reset
    end

    context "collecting the metrics" do
      let(:collection) { MetricsCollector::Collector.collect }
      subject { collection }

      it "has a collection of snapshots" do
        subject.should_not be_empty
      end

      it "contains only one metric" do
        subject.size.should == 1
      end

      context "with a metric" do
        subject { collection.first }

        it "contains a MetricSnapshot" do
          subject.should be_a(MetricsCollector::MetricSnapshot)
        end

        it "contains a snapshot for Project counter" do
          subject.name.should eq(:counter)
        end

        it "contains a reading from Project counter" do
          subject.value.should == 1
        end
      end
    end
  end

end
