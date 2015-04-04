require "spec_helper"

describe CopysecsController do
  describe "routing" do

    it "routes to #index" do
      get("/copysecs").should route_to("copysecs#index")
    end

    it "routes to #new" do
      get("/copysecs/new").should route_to("copysecs#new")
    end

    it "routes to #show" do
      get("/copysecs/1").should route_to("copysecs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/copysecs/1/edit").should route_to("copysecs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/copysecs").should route_to("copysecs#create")
    end

    it "routes to #update" do
      put("/copysecs/1").should route_to("copysecs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/copysecs/1").should route_to("copysecs#destroy", :id => "1")
    end

  end
end
