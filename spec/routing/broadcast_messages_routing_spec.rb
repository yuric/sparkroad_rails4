require "spec_helper"

describe BroadcastMessagesController do
  describe "routing" do

    it "routes to #index" do
      get("/broadcast_messages").should route_to("broadcast_messages#index")
    end

    it "routes to #new" do
      get("/broadcast_messages/new").should route_to("broadcast_messages#new")
    end

    it "routes to #show" do
      get("/broadcast_messages/1").should route_to("broadcast_messages#show", :id => "1")
    end

    it "routes to #edit" do
      get("/broadcast_messages/1/edit").should route_to("broadcast_messages#edit", :id => "1")
    end

    it "routes to #create" do
      post("/broadcast_messages").should route_to("broadcast_messages#create")
    end

    it "routes to #update" do
      put("/broadcast_messages/1").should route_to("broadcast_messages#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/broadcast_messages/1").should route_to("broadcast_messages#destroy", :id => "1")
    end

  end
end
