require 'spec_helper'

describe "globals/show" do
  before(:each) do
    @global = assign(:global, stub_model(Global,
      :section_id => 1,
      :name => "Name",
      :section => "Section",
      :subsection => "Subsection",
      :image => "Image",
      :title => "Title",
      :sku => "Sku",
      :quantity => "Quantity",
      :name => "Name",
      :description => "Description",
      :subdecription => "Subdecription",
      :price => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
    rendered.should match(/Section/)
    rendered.should match(/Subsection/)
    rendered.should match(/Image/)
    rendered.should match(/Title/)
    rendered.should match(/Sku/)
    rendered.should match(/Quantity/)
    rendered.should match(/Name/)
    rendered.should match(/Description/)
    rendered.should match(/Subdecription/)
    rendered.should match(/2/)
  end
end
