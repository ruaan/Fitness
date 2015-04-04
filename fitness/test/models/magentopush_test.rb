require "test_helper"

describe Magentopush do
  let(:magentopush) { Magentopush.new }

  it "must be valid" do
    magentopush.must_be :valid?
  end
end
