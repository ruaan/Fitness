require 'spec_helper'

describe "copysubs/edit" do
  before(:each) do
    @copysub = assign(:copysub, stub_model(Copysub,
      :section_id => 1,
      :subsection_id => 1,
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit copysub form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", copysub_path(@copysub), "post" do
      assert_select "input#copysub_section_id[name=?]", "copysub[section_id]"
      assert_select "input#copysub_subsection_id[name=?]", "copysub[subsection_id]"
      assert_select "input#copysub_name[name=?]", "copysub[name]"
      assert_select "input#copysub_description[name=?]", "copysub[description]"
    end
  end
end
