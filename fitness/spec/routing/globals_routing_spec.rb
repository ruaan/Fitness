require "spec_helper"

describe GlobalsController do
  describe "routing" do

    it "routes to #index" do
      get("/globals").should route_to("globals#index")
    end

    it "routes to #new" do
      get("/globals/new").should route_to("globals#new")
    end

    it "routes to #show" do
      get("/globals/1").should route_to("globals#show", :id => "1")
    end

    it "routes to #edit" do
      get("/globals/1/edit").should route_to("globals#edit", :id => "1")
    end

    it "routes to #create" do
      post("/globals").should route_to("globals#create")
    end

    it "routes to #update" do
      put("/globals/1").should route_to("globals#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/globals/1").should route_to("globals#destroy", :id => "1")
    end

  end
end
