require "spec_helper"

describe CopysubsController do
  describe "routing" do

    it "routes to #index" do
      get("/copysubs").should route_to("copysubs#index")
    end

    it "routes to #new" do
      get("/copysubs/new").should route_to("copysubs#new")
    end

    it "routes to #show" do
      get("/copysubs/1").should route_to("copysubs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/copysubs/1/edit").should route_to("copysubs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/copysubs").should route_to("copysubs#create")
    end

    it "routes to #update" do
      put("/copysubs/1").should route_to("copysubs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/copysubs/1").should route_to("copysubs#destroy", :id => "1")
    end

  end
end
