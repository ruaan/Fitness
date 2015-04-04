require 'spec_helper'

describe "Installs" do
  describe "GET /installs" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get installs_path
      response.status.should be(200)
    end
  end
end
