describe StaticPagesController do
  it "routes to GET static_pages_about" do
    get("/static_pages/about").should route_to("static_pages#about")
  end

  it "routes to GET static_pages_terms" do
    get("/static_pages/terms").should route_to("static_pages#terms")
  end

  it "routes to GET root" do
    get("/").should route_to("static_pages#home")
  end
end