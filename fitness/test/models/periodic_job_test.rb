require "test_helper"

describe PeriodicJob do
  let(:periodic_job) { PeriodicJob.new }

  it "must be valid" do
    periodic_job.must_be :valid?
  end
end
