require 'spec_helper'

describe "projects/new" do
  before(:each) do
    assign(:project, stub_model(Project,
      :account_id => 1,
      :projectName => "MyString",
      :version => "MyString",
      :documentType => "MyString",
      :market => "MyString",
      :randDollar => 1,
      :randPound => 1,
      :address => "MyString",
      :contactPerson => "MyString",
      :contactNumber => "MyString",
      :notes => "MyString",
      :flag => 1
    ).as_new_record)
  end

  it "renders new project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", projects_path, "post" do
      assert_select "input#project_account_id[name=?]", "project[account_id]"
      assert_select "input#project_projectName[name=?]", "project[projectName]"
      assert_select "input#project_version[name=?]", "project[version]"
      assert_select "input#project_documentType[name=?]", "project[documentType]"
      assert_select "input#project_market[name=?]", "project[market]"
      assert_select "input#project_randDollar[name=?]", "project[randDollar]"
      assert_select "input#project_randPound[name=?]", "project[randPound]"
      assert_select "input#project_address[name=?]", "project[address]"
      assert_select "input#project_contactPerson[name=?]", "project[contactPerson]"
      assert_select "input#project_contactNumber[name=?]", "project[contactNumber]"
      assert_select "input#project_notes[name=?]", "project[notes]"
      assert_select "input#project_flag[name=?]", "project[flag]"
    end
  end
end
