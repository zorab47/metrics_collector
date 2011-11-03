require "spec_helper"

describe MetricsCollector::ModelAdditions do
  subject { Project }

  it "can define metrics on models" do
    subject.should respond_to(:metric)
  end

  context "with a metric defined" do
    before do
      subject.class_eval do
        metric :count do
          0.0
        end
      end
    end

    it "adds that metric to the metric list" do
      subject.metrics.should_not be_empty
    end

    it "adds the class to Collector" do
      MetricsCollector::Collector.monitored_classes.should include(Project)
    end

    it "saves the block as a metric instance" do
      subject.metrics[:count].should be_kind_of(MetricsCollector::Metric)
    end
  end

  context "with multiple metrics defined" do
    before do
      Project.class_eval do
        metric :count do
          0.0
        end

        metric :usage do
          0.0
        end
      end
    end

    it "contains multiple unique metrics" do
      subject.metrics.size.should == 2
    end
  end
end
