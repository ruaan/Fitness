require "test_helper"

describe Sap do
  let(:sap) { Sap.new }

  it "must be valid" do
    sap.must_be :valid?
  end
end
