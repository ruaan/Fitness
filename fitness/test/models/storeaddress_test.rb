require "test_helper"

describe Storeaddress do
  let(:storeaddress) { Storeaddress.new }

  it "must be valid" do
    storeaddress.must_be :valid?
  end
end
