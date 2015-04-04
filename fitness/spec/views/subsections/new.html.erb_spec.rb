require 'spec_helper'

describe "subsections/new" do
  before(:each) do
    assign(:subsection, stub_model(Subsection,
      :section_id => 1,
      :name => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new subsection form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", subsections_path, "post" do
      assert_select "input#subsection_section_id[name=?]", "subsection[section_id]"
      assert_select "input#subsection_name[name=?]", "subsection[name]"
      assert_select "input#subsection_description[name=?]", "subsection[description]"
    end
  end
end
