require "spec_helper"

describe BroadcastMediaController do
  describe "routing" do

    it "routes to #index" do
      get("/broadcast_media").should route_to("broadcast_media#index")
    end

    it "routes to #new" do
      get("/broadcast_media/new").should route_to("broadcast_media#new")
    end

    it "routes to #show" do
      get("/broadcast_media/1").should route_to("broadcast_media#show", :id => "1")
    end

    it "routes to #edit" do
      get("/broadcast_media/1/edit").should route_to("broadcast_media#edit", :id => "1")
    end

    it "routes to #create" do
      post("/broadcast_media").should route_to("broadcast_media#create")
    end

    it "routes to #update" do
      put("/broadcast_media/1").should route_to("broadcast_media#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/broadcast_media/1").should route_to("broadcast_media#destroy", :id => "1")
    end

  end
end
