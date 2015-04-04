require "spec_helper"

describe InstallsController do
  describe "routing" do

    it "routes to #index" do
      get("/installs").should route_to("installs#index")
    end

    it "routes to #new" do
      get("/installs/new").should route_to("installs#new")
    end

    it "routes to #show" do
      get("/installs/1").should route_to("installs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/installs/1/edit").should route_to("installs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/installs").should route_to("installs#create")
    end

    it "routes to #update" do
      put("/installs/1").should route_to("installs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/installs/1").should route_to("installs#destroy", :id => "1")
    end

  end
end
