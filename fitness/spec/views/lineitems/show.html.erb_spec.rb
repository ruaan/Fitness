require 'spec_helper'

describe "lineitems/show" do
  before(:each) do
    @lineitem = assign(:lineitem, stub_model(Lineitem,
      :image => "Image",
      :title => "Title",
      :sku => "Sku",
      :catagory => "Catagory",
      :price => 1,
      :description => "Description",
      :subdescription => "Subdescription"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Image/)
    rendered.should match(/Title/)
    rendered.should match(/Sku/)
    rendered.should match(/Catagory/)
    rendered.should match(/1/)
    rendered.should match(/Description/)
    rendered.should match(/Subdescription/)
  end
end
