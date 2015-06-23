require 'spec_helper'

describe "Static pages" do

  # This is just a sanity check:

  before(:each) { visit root_path }
  subject { page }

  context "Home page should have" do

    specify { true.should be true }

    describe "correct title" do
      it { should have_selector('title', text: full_title("Hacker terms from the hacker community")) }
    end

    describe "logo" do
      it { should have_css("#brand") }
      it "should link to the homepage" do
        click_link("brand")
        current_path.should eq root_path
      end
    end


    describe "top rated links" do

      it "should show link definitions" do
        should have_css('div.definition')
      end
    end

    describe "submit your own term box" do
      it { should have_selector 'div', id: "create_definition" }
      it "should redirect when submitting a link" do
        click_link "create_definition"
        current_path.should eq new_definition_path
      end
    end

    describe "login links" do
      it { should have_selector 'a', text: "Sign In" }

      describe "that link to the login page" do
        before { click_link "sign_in" }

        it "should redirect to the Sign In page" do
          current_path.should eq new_user_session_path
        end

        describe "with correct form data" do
          it { should have_content("Username") }
          it { should have_content("Password") }
          it { should have_content("Sign In") }
          it { should have_css("input#user_password") }
        end
      end
    end

  end


end