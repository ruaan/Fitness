require "spec_helper"

describe LineitemsController do
  describe "routing" do

    it "routes to #index" do
      get("/lineitems").should route_to("lineitems#index")
    end

    it "routes to #new" do
      get("/lineitems/new").should route_to("lineitems#new")
    end

    it "routes to #show" do
      get("/lineitems/1").should route_to("lineitems#show", :id => "1")
    end

    it "routes to #edit" do
      get("/lineitems/1/edit").should route_to("lineitems#edit", :id => "1")
    end

    it "routes to #create" do
      post("/lineitems").should route_to("lineitems#create")
    end

    it "routes to #update" do
      put("/lineitems/1").should route_to("lineitems#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/lineitems/1").should route_to("lineitems#destroy", :id => "1")
    end

  end
end
