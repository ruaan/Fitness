require 'spec_helper'

describe "favourites/show" do
  before(:each) do
    @favourite = assign(:favourite, stub_model(Favourite,
      :user_id => "User",
      :name => "Name",
      :section => "Section",
      :subsection => "Subsection",
      :product_ids => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/User/)
    rendered.should match(/Name/)
    rendered.should match(/Section/)
    rendered.should match(/Subsection/)
    rendered.should match(/1/)
  end
end
