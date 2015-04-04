require 'spec_helper'

describe "accounts/index" do
  before(:each) do
    assign(:accounts, [
      stub_model(Account,
        :user_id => 1,
        :name => "Name",
        :phone => "Phone",
        :email => "Email",
        :address => "Address",
        :vat => "Vat"
      ),
      stub_model(Account,
        :user_id => 1,
        :name => "Name",
        :phone => "Phone",
        :email => "Email",
        :address => "Address",
        :vat => "Vat"
      )
    ])
  end

  it "renders a list of accounts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Vat".to_s, :count => 2
  end
end
