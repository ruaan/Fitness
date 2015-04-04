require 'spec_helper'

describe "installs/show" do
  before(:each) do
    @install = assign(:install, stub_model(Install,
      :image => "Image",
      :title => "Title",
      :sku => "Sku",
      :category => "Category",
      :price => "Price",
      :quantity => "Quantity",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Image/)
    rendered.should match(/Title/)
    rendered.should match(/Sku/)
    rendered.should match(/Category/)
    rendered.should match(/Price/)
    rendered.should match(/Quantity/)
    rendered.should match(/Description/)
  end
end
