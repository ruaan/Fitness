require "test_helper"

describe Magento do
  let(:magento) { Magento.new }

  it "must be valid" do
    magento.must_be :valid?
  end
end
