require 'spec_helper'

describe "quotes/index" do
  before(:each) do
    assign(:quotes, [
      stub_model(Quote,
        :project_id => 1,
        :section_id => 2,
        :subsection_id => 3,
        :fav_id => 4,
        :fav => false,
        :image => "Image",
        :title => "Title",
        :sku => "Sku",
        :category => "Category",
        :manufacturer => "Manufacturer",
        :price => "Price",
        :discount => 5,
        :description => "Description",
        :subdescription => "Subdescription"
      ),
      stub_model(Quote,
        :project_id => 1,
        :section_id => 2,
        :subsection_id => 3,
        :fav_id => 4,
        :fav => false,
        :image => "Image",
        :title => "Title",
        :sku => "Sku",
        :category => "Category",
        :manufacturer => "Manufacturer",
        :price => "Price",
        :discount => 5,
        :description => "Description",
        :subdescription => "Subdescription"
      )
    ])
  end

  it "renders a list of quotes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Sku".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "Manufacturer".to_s, :count => 2
    assert_select "tr>td", :text => "Price".to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Subdescription".to_s, :count => 2
  end
end
