require 'spec_helper'

describe "Static pages" do

  before { visit root_path }
  subject { page }

  it_behaves_like "all pages"

  context "Home page should have" do

    describe "correct title" do
      it { should have_selector('title', text: full_title("Hacker terms from the hacker community")) }
    end

    describe "logo" do
      it { should have_css("#brand") }
      it "should link to the homepage" do
        click_link("brand_link")
        current_path.should eq root_path
      end
    end

    describe "top rated links" do
      it { should have_selector('div', class: "top-links") }
    end

    describe "submit your own term box" do
      it { should have_selector 'div', id: "create_definition" }
      it "should redirect when submitting a link" do
        click_link "create_definition"
        current_path.should eq new_definition_path
      end
    end

    describe "have login links" do
      it { should have_css 'div#login_box' }
      it { should have_selector 'a', text: "Log In" }

      describe "that link to the login page" do
        before { click_link "Log In" }
        it { should have_content("Email") }
        it { should have_content("Password") }
        it { should have_content("Log In") }
        it { should have_css("input#user_email") }
        it { should have_css("input#user_password") }
      end
    end
  end


end