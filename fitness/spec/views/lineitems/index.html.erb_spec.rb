require 'spec_helper'

describe "lineitems/index" do
  before(:each) do
    assign(:lineitems, [
      stub_model(Lineitem,
        :image => "Image",
        :title => "Title",
        :sku => "Sku",
        :catagory => "Catagory",
        :price => 1,
        :description => "Description",
        :subdescription => "Subdescription"
      ),
      stub_model(Lineitem,
        :image => "Image",
        :title => "Title",
        :sku => "Sku",
        :catagory => "Catagory",
        :price => 1,
        :description => "Description",
        :subdescription => "Subdescription"
      )
    ])
  end

  it "renders a list of lineitems" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Sku".to_s, :count => 2
    assert_select "tr>td", :text => "Catagory".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Subdescription".to_s, :count => 2
  end
end
