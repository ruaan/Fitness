require 'spec_helper'

describe "copysubs/show" do
  before(:each) do
    @copysub = assign(:copysub, stub_model(Copysub,
      :section_id => 1,
      :subsection_id => 2,
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
