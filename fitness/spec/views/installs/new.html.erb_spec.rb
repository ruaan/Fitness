require 'spec_helper'

describe "installs/new" do
  before(:each) do
    assign(:install, stub_model(Install,
      :image => "MyString",
      :title => "MyString",
      :sku => "MyString",
      :category => "MyString",
      :price => "MyString",
      :quantity => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new install form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", installs_path, "post" do
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
