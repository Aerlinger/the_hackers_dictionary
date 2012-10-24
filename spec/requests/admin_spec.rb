require "spec_helper"

describe "Admin actions" do
  before do
    user = FactoryGirl.create(:user)
    sign_in user
    subject { page }
  end

  xit "adds a definition" do
  end


end