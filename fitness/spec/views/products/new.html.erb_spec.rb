require 'spec_helper'

describe "products/new" do
  before(:each) do
    assign(:product, stub_model(Product,
      :image => "MyString",
      :title => "MyString",
      :sku => "MyString",
      :catagory => "MyString",
      :price => 1,
      :description => "MyString",
      :subdescription => "MyString"
    ).as_new_record)
  end

  it "renders new product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", products_path, "post" do
      assert_select "input#product_image[name=?]", "product[image]"
      assert_select "input#product_title[name=?]", "product[title]"
      assert_select "input#product_sku[name=?]", "product[sku]"
      assert_select "input#product_catagory[name=?]", "product[catagory]"
      assert_select "input#product_price[name=?]", "product[price]"
      assert_select "input#product_description[name=?]", "product[description]"
      assert_select "input#product_subdescription[name=?]", "product[subdescription]"
    end
  end
end
