require 'spec_helper'

describe "installs/index" do
  before(:each) do
    assign(:installs, [
      stub_model(Install,
        :image => "Image",
        :title => "Title",
        :sku => "Sku",
        :category => "Category",
        :price => "Price",
        :quantity => "Quantity",
        :description => "Description"
      ),
      stub_model(Install,
        :image => "Image",
        :title => "Title",
        :sku => "Sku",
        :category => "Category",
        :price => "Price",
        :quantity => "Quantity",
        :description => "Description"
      )
    ])
  end

  it "renders a list of installs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Sku".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "Price".to_s, :count => 2
    assert_select "tr>td", :text => "Quantity".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
