describe DefinitionsController do

  describe "definition routes" do
    it "routes to #index" do
      get("/definitions").should route_to("definitions#index")
    end

    it "routes to #new" do
      get("/definitions/new").should route_to("definitions#new")
    end

    it "routes to #show" do
      get("/definitions/1").should route_to("definitions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/definitions/1/edit").should route_to("definitions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/definitions").should route_to("definitions#create")
    end

    it "routes to #update" do
      put("/definitions/1").should route_to("definitions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/definitions/1").should route_to("definitions#destroy", :id => "1")
    end
  end

end