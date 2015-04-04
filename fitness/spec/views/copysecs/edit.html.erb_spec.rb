require 'spec_helper'

describe "copysecs/edit" do
  before(:each) do
    @copysec = assign(:copysec, stub_model(Copysec,
      :project_id => 1,
      :section_id => 1,
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit copysec form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", copysec_path(@copysec), "post" do
      assert_select "input#copysec_project_id[name=?]", "copysec[project_id]"
      assert_select "input#copysec_section_id[name=?]", "copysec[section_id]"
      assert_select "input#copysec_name[name=?]", "copysec[name]"
      assert_select "input#copysec_description[name=?]", "copysec[description]"
    end
  end
end
