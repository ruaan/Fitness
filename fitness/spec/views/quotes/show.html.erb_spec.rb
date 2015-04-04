require 'spec_helper'

describe "quotes/show" do
  before(:each) do
    @quote = assign(:quote, stub_model(Quote,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/false/)
    rendered.should match(/Image/)
    rendered.should match(/Title/)
    rendered.should match(/Sku/)
    rendered.should match(/Category/)
    rendered.should match(/Manufacturer/)
    rendered.should match(/Price/)
    rendered.should match(/5/)
    rendered.should match(/Description/)
    rendered.should match(/Subdescription/)
  end
end
