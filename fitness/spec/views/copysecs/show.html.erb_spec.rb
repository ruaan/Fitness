require 'spec_helper'

describe "copysecs/show" do
  before(:each) do
    @copysec = assign(:copysec, stub_model(Copysec,
      :project_id => 1,
      :section_id => 2,
      :name => "Name",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Name/)
    rendered.should match(/Description/)
  end
end
