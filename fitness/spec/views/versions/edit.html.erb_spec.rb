require 'spec_helper'

describe "versions/edit" do
  before(:each) do
    @version = assign(:version, stub_model(Version,
      :account_id => 1,
      :project_id => 1,
      :user_id => "",
      :version => "MyString"
    ))
  end

  it "renders the edit version form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", version_path(@version), "post" do
      assert_select "input#version_account_id[name=?]", "version[account_id]"
      assert_select "input#version_project_id[name=?]", "version[project_id]"
      assert_select "input#version_user_id[name=?]", "version[user_id]"
      assert_select "input#version_version[name=?]", "version[version]"
    end
  end
end
