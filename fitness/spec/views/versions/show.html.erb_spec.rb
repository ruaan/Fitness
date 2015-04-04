require 'spec_helper'

describe "versions/show" do
  before(:each) do
    @version = assign(:version, stub_model(Version,
      :account_id => 1,
      :project_id => 2,
      :user_id => "",
      :version => "Version"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(//)
    rendered.should match(/Version/)
  end
end
