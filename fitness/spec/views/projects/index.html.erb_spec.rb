require 'spec_helper'

describe "projects/index" do
  before(:each) do
    assign(:projects, [
      stub_model(Project,
        :account_id => 1,
        :projectName => "Project Name",
        :version => "Version",
        :documentType => "Document Type",
        :market => "Market",
        :randDollar => 2,
        :randPound => 3,
        :address => "Address",
        :contactPerson => "Contact Person",
        :contactNumber => "Contact Number",
        :notes => "Notes",
        :flag => 4
      ),
      stub_model(Project,
        :account_id => 1,
        :projectName => "Project Name",
        :version => "Version",
        :documentType => "Document Type",
        :market => "Market",
        :randDollar => 2,
        :randPound => 3,
        :address => "Address",
        :contactPerson => "Contact Person",
        :contactNumber => "Contact Number",
        :notes => "Notes",
        :flag => 4
      )
    ])
  end

  it "renders a list of projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Project Name".to_s, :count => 2
    assert_select "tr>td", :text => "Version".to_s, :count => 2
    assert_select "tr>td", :text => "Document Type".to_s, :count => 2
    assert_select "tr>td", :text => "Market".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Person".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Number".to_s, :count => 2
    assert_select "tr>td", :text => "Notes".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
