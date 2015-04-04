require 'spec_helper'

describe "projects/show" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Project Name/)
    rendered.should match(/Version/)
    rendered.should match(/Document Type/)
    rendered.should match(/Market/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/Address/)
    rendered.should match(/Contact Person/)
    rendered.should match(/Contact Number/)
    rendered.should match(/Notes/)
    rendered.should match(/4/)
  end
end
