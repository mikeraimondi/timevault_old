require "spec_helper"

describe PomodorosController do
  describe "routing" do

    it "routes to #index" do
      get("/pomodoros").should route_to("pomodoros#index")
    end

    it "routes to #new" do
      get("/pomodoros/new").should route_to("pomodoros#new")
    end

    it "routes to #show" do
      get("/pomodoros/1").should route_to("pomodoros#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pomodoros/1/edit").should route_to("pomodoros#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pomodoros").should route_to("pomodoros#create")
    end

    it "routes to #update" do
      put("/pomodoros/1").should route_to("pomodoros#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pomodoros/1").should route_to("pomodoros#destroy", :id => "1")
    end

  end
end
