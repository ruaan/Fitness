require 'spec_helper'

describe "globals/edit" do
  before(:each) do
    @global = assign(:global, stub_model(Global,
      :section_id => 1,
      :name => "MyString",
      :section => "MyString",
      :subsection => "MyString",
      :image => "MyString",
      :title => "MyString",
      :sku => "MyString",
      :quantity => "MyString",
      :name => "MyString",
      :description => "MyString",
      :subdecription => "MyString",
      :price => 1
    ))
  end

  it "renders the edit global form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", global_path(@global), "post" do
      assert_select "input#global_section_id[name=?]", "global[section_id]"
      assert_select "input#global_name[name=?]", "global[name]"
      assert_select "input#global_section[name=?]", "global[section]"
      assert_select "input#global_subsection[name=?]", "global[subsection]"
      assert_select "input#global_image[name=?]", "global[image]"
      assert_select "input#global_title[name=?]", "global[title]"
      assert_select "input#global_sku[name=?]", "global[sku]"
      assert_select "input#global_quantity[name=?]", "global[quantity]"
      assert_select "input#global_name[name=?]", "global[name]"
      assert_select "input#global_description[name=?]", "global[description]"
      assert_select "input#global_subdecription[name=?]", "global[subdecription]"
      assert_select "input#global_price[name=?]", "global[price]"
    end
  end
end
