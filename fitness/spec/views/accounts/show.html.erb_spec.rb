require 'spec_helper'

describe "accounts/show" do
  before(:each) do
    @account = assign(:account, stub_model(Account,
      :user_id => 1,
      :name => "Name",
      :phone => "Phone",
      :email => "Email",
      :address => "Address",
      :vat => "Vat"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
    rendered.should match(/Phone/)
    rendered.should match(/Email/)
    rendered.should match(/Address/)
    rendered.should match(/Vat/)
  end
end
