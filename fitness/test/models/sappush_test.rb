require "test_helper"

describe Sappush do
  let(:sappush) { Sappush.new }

  it "must be valid" do
    sappush.must_be :valid?
  end
end
