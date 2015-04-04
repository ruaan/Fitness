require 'spec_helper'

describe "copysubs/index" do
  before(:each) do
    assign(:copysubs, [
      stub_model(Copysub,
        :section_id => 1,
        :subsection_id => 2,
        :name => "Name",
        :description => "Description"
      ),
      stub_model(Copysub,
        :section_id => 1,
        :subsection_id => 2,
        :name => "Name",
        :description => "Description"
      )
    ])
  end

  it "renders a list of copysubs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
