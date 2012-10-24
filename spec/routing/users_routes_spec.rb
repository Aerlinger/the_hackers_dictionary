describe "Devise routes" do

  describe Devise::SessionsController do

    # Session Login/Logout Routing:
    it "routes to GET new_user_session" do
      get("/users/sign_in").should route_to("devise/sessions#new")
    end

    it "routes to POST user_session" do
      post("/users/sign_in").should route_to("devise/sessions#create")
    end

    it "routes to DELETE destroy_user_session" do
      delete("/users/sign_out").should route_to("devise/sessions#destroy")
    end

  end

  # Password Routing:
  describe Devise::PasswordsController do

    it "routes to POST user_password" do
      post("/users/password").should route_to("devise/passwords#create")
    end

    it "routes to GET new_user_password" do
      get("/users/password/new").should route_to("devise/passwords#new")
    end

    it "routes to GET edit_user_password" do
      get("/users/password/edit").should route_to("devise/passwords#edit")
    end

    it "routes to PUT edit_user_password" do
      put("/users/password").should route_to("devise/passwords#update")
    end

  end

  # Registrations Routing:
  describe Devise::RegistrationsController do

    it "routes to GET cancel_user_registration" do
      get("/users/cancel").should route_to("devise/registrations#cancel")
    end

    it "routes to POST user_registration" do
      post("/users").should route_to("devise/registrations#create")
    end

    it "routes to GET new_user_registration" do
      get("/users/sign_up").should route_to("devise/registrations#new")
    end

    it "routes to GET edit_user_registration" do
      get("/users/edit").should route_to("devise/registrations#edit")
    end

    it "routes to PUT new_user_registrations" do
      put("/users").should route_to("devise/registrations#update")
    end

    it "routes to DELETE users(:id)" do
      delete("/users").should route_to("devise/registrations#destroy")
    end

  end
end