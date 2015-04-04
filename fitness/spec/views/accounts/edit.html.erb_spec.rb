require 'spec_helper'

describe "accounts/edit" do
  before(:each) do
    @account = assign(:account, stub_model(Account,
      :user_id => 1,
      :name => "MyString",
      :phone => "MyString",
      :email => "MyString",
      :address => "MyString",
      :vat => "MyString"
    ))
  end

  it "renders the edit account form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", account_path(@account), "post" do
      assert_select "input#account_user_id[name=?]", "account[user_id]"
      assert_select "input#account_name[name=?]", "account[name]"
      assert_select "input#account_phone[name=?]", "account[phone]"
      assert_select "input#account_email[name=?]", "account[email]"
      assert_select "input#account_address[name=?]", "account[address]"
      assert_select "input#account_vat[name=?]", "account[vat]"
    end
  end
end
