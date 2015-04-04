require 'spec_helper'

describe "quotes/new" do
  before(:each) do
    assign(:quote, stub_model(Quote,
      :project_id => 1,
      :section_id => 1,
      :subsection_id => 1,
      :fav_id => 1,
      :fav => false,
      :image => "MyString",
      :title => "MyString",
      :sku => "MyString",
      :category => "MyString",
      :manufacturer => "MyString",
      :price => "MyString",
      :discount => 1,
      :description => "MyString",
      :subdescription => "MyString"
    ).as_new_record)
  end

  it "renders new quote form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", quotes_path, "post" do
      assert_select "input#quote_project_id[name=?]", "quote[project_id]"
      assert_select "input#quote_section_id[name=?]", "quote[section_id]"
      assert_select "input#quote_subsection_id[name=?]", "quote[subsection_id]"
      assert_select "input#quote_fav_id[name=?]", "quote[fav_id]"
      assert_select "input#quote_fav[name=?]", "quote[fav]"
      assert_select "input#quote_image[name=?]", "quote[image]"
      assert_select "input#quote_title[name=?]", "quote[title]"
      assert_select "input#quote_sku[name=?]", "quote[sku]"
      assert_select "input#quote_category[name=?]", "quote[category]"
      assert_select "input#quote_manufacturer[name=?]", "quote[manufacturer]"
      assert_select "input#quote_price[name=?]", "quote[price]"
      assert_select "input#quote_discount[name=?]", "quote[discount]"
      assert_select "input#quote_description[name=?]", "quote[description]"
      assert_select "input#quote_subdescription[name=?]", "quote[subdescription]"
    end
  end
end
