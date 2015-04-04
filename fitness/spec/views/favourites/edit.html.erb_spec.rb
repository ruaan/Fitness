require 'spec_helper'

describe "favourites/edit" do
  before(:each) do
    @favourite = assign(:favourite, stub_model(Favourite,
      :user_id => "MyString",
      :name => "MyString",
      :section => "MyString",
      :subsection => "MyString",
      :product_ids => 1
    ))
  end

  it "renders the edit favourite form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", favourite_path(@favourite), "post" do
      assert_select "input#favourite_user_id[name=?]", "favourite[user_id]"
      assert_select "input#favourite_name[name=?]", "favourite[name]"
      assert_select "input#favourite_section[name=?]", "favourite[section]"
      assert_select "input#favourite_subsection[name=?]", "favourite[subsection]"
      assert_select "input#favourite_product_ids[name=?]", "favourite[product_ids]"
    end
  end
end
