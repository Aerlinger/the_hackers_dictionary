require 'spec_helper'

describe "User Pages" do

  before do
    visit root_path
    sign_out_user
  end

  describe "After signing in" do

    before do
      User.delete_all
      @new_user = FactoryGirl.create(:user)
      sign_in_user @new_user
    end

    it "should display sign out link" do
      page.should have_selector 'a', text: "Sign Out"
      page.current_path.should eq root_path
    end

    it "should show user links" do
      page.should have_selector 'a', text: @new_user.username
    end

    it "should link to user profile" do
      click_link @new_user.username
      page.should have_content @new_user.username
    end

    it "should have link to profile page" do
    end

    it "should not be admin" do
      @new_user.should_not be_admin
    end

    it "should not display edit or delete links for definitions" do
      page.should_not have_css(".edit-delete")
    end

    describe "Log out newly created user" do
      before { click_link "Sign Out" }

      it "should show sign in link" do
        page.should have_selector("a", text: "Sign In")
        page.current_path.should eq root_path
      end
    end


    describe "with aerlinger (admin) account" do

      before { @new_user = FactoryGirl.create(:user, username: 'Aerlinger') }

      it "should be an admin" do
        @new_user.admin.should be_true
      end

      xit "should display edit or delete links for definitions" do
        visit(root_path)
        within("div.definition") do
          page.should have_selector('a', text: 'Edit')
          page.should have_selector('a', text: 'Delete')
        end
      end
    end

  end

end