require 'spec_helper'

describe "sections/index" do
  before(:each) do
    assign(:sections, [
      stub_model(Section,
        :project_id => 1,
        :name => "Name",
        :description => "Description",
        :misc => "Misc"
      ),
      stub_model(Section,
        :project_id => 1,
        :name => "Name",
        :description => "Description",
        :misc => "Misc"
      )
    ])
  end

  it "renders a list of sections" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Misc".to_s, :count => 2
  end
end
