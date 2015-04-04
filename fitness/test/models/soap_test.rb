require "test_helper"

describe Soap do
  let(:soap) { Soap.new }

  it "must be valid" do
    soap.must_be :valid?
  end
end
