require 'spec_helper'

describe "accounts/new" do
  before(:each) do
    assign(:account, stub_model(Account,
      :user_id => 1,
      :name => "MyString",
      :phone => "MyString",
      :email => "MyString",
      :address => "MyString",
      :vat => "MyString"
    ).as_new_record)
  end

  it "renders new account form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", accounts_path, "post" do
      assert_select "input#account_user_id[name=?]", "account[user_id]"
      assert_select "input#account_name[name=?]", "account[name]"
      assert_select "input#account_phone[name=?]", "account[phone]"
      assert_select "input#account_email[name=?]", "account[email]"
      assert_select "input#account_address[name=?]", "account[address]"
      assert_select "input#account_vat[name=?]", "account[vat]"
    end
  end
end
