require 'spec_helper'

describe "copysecs/index" do
  before(:each) do
    assign(:copysecs, [
      stub_model(Copysec,
        :project_id => 1,
        :section_id => 2,
        :name => "Name",
        :description => "Description"
      ),
      stub_model(Copysec,
        :project_id => 1,
        :section_id => 2,
        :name => "Name",
        :description => "Description"
      )
    ])
  end

  it "renders a list of copysecs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
