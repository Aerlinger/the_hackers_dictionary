require "spec_helper"

describe "Admin actions" do

  before do
    @user = FactoryGirl.create(:user)
    sign_in_user @user
    @user.toggle(:admin)
    subject { @user }
  end

  it "should be an administrator" do
    @user.should be_admin
  end

  xit "adds a definition" do
  end

end