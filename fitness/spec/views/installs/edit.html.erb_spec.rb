require 'spec_helper'

describe "installs/edit" do
  before(:each) do
    @install = assign(:install, stub_model(Install,
      :image => "MyString",
      :title => "MyString",
      :sku => "MyString",
      :category => "MyString",
      :price => "MyString",
      :quantity => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit install form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", install_path(@install), "post" do
      assert_select "input#install_image[name=?]", "install[image]"
      assert_select "input#install_title[name=?]", "install[title]"
      assert_select "input#install_sku[name=?]", "install[sku]"
      assert_select "input#install_category[name=?]", "install[category]"
      assert_select "input#install_price[name=?]", "install[price]"
      assert_select "input#install_quantity[name=?]", "install[quantity]"
      assert_select "input#install_description[name=?]", "install[description]"
    end
  end
end
