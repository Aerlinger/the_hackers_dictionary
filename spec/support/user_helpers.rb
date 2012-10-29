include ApplicationHelper
include StaticPagesHelper

def sign_in_user(user)
  visit new_user_session_path
  fill_in "Username", with: user.username
  fill_in "Password", with: user.password

  click_button "Sign in"

end

def register_user(username, password)
  visit new_user_registration_path
  fill_in "Username", with: username
  fill_in "Password", with: password
  fill_in "Password Confirmation", with: password
  within("form") do
    click_link "Create Account"
  end
end

def sign_out_user
  delete destroy_user_session_path
end