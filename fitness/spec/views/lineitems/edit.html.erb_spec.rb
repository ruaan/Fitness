require 'spec_helper'

describe "lineitems/edit" do
  before(:each) do
    @lineitem = assign(:lineitem, stub_model(Lineitem,
      :image => "MyString",
      :title => "MyString",
      :sku => "MyString",
      :catagory => "MyString",
      :price => 1,
      :description => "MyString",
      :subdescription => "MyString"
    ))
  end

  it "renders the edit lineitem form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", lineitem_path(@lineitem), "post" do
      assert_select "input#lineitem_image[name=?]", "lineitem[image]"
      assert_select "input#lineitem_title[name=?]", "lineitem[title]"
      assert_select "input#lineitem_sku[name=?]", "lineitem[sku]"
      assert_select "input#lineitem_catagory[name=?]", "lineitem[catagory]"
      assert_select "input#lineitem_price[name=?]", "lineitem[price]"
      assert_select "input#lineitem_description[name=?]", "lineitem[description]"
      assert_select "input#lineitem_subdescription[name=?]", "lineitem[subdescription]"
    end
  end
end
