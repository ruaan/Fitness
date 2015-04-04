require 'spec_helper'

describe "versions/index" do
  before(:each) do
    assign(:versions, [
      stub_model(Version,
        :account_id => 1,
        :project_id => 2,
        :user_id => "",
        :version => "Version"
      ),
      stub_model(Version,
        :account_id => 1,
        :project_id => 2,
        :user_id => "",
        :version => "Version"
      )
    ])
  end

  it "renders a list of versions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Version".to_s, :count => 2
  end
end
