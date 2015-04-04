require 'spec_helper'

describe "sections/edit" do
  before(:each) do
    @section = assign(:section, stub_model(Section,
      :project_id => 1,
      :name => "MyString",
      :description => "MyString",
      :misc => "MyString"
    ))
  end

  it "renders the edit section form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", section_path(@section), "post" do
      assert_select "input#section_project_id[name=?]", "section[project_id]"
      assert_select "input#section_name[name=?]", "section[name]"
      assert_select "input#section_description[name=?]", "section[description]"
      assert_select "input#section_misc[name=?]", "section[misc]"
    end
  end
end
