require 'spec_helper'

describe "globals/index" do
  before(:each) do
    assign(:globals, [
      stub_model(Global,
        :section_id => 1,
        :name => "Name",
        :section => "Section",
        :subsection => "Subsection",
        :image => "Image",
        :title => "Title",
        :sku => "Sku",
        :quantity => "Quantity",
        :name => "Name",
        :description => "Description",
        :subdecription => "Subdecription",
        :price => 2
      ),
      stub_model(Global,
        :section_id => 1,
        :name => "Name",
        :section => "Section",
        :subsection => "Subsection",
        :image => "Image",
        :title => "Title",
        :sku => "Sku",
        :quantity => "Quantity",
        :name => "Name",
        :description => "Description",
        :subdecription => "Subdecription",
        :price => 2
      )
    ])
  end

  it "renders a list of globals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Section".to_s, :count => 2
    assert_select "tr>td", :text => "Subsection".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Sku".to_s, :count => 2
    assert_select "tr>td", :text => "Quantity".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Subdecription".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
