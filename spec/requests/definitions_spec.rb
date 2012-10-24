require 'spec_helper'

describe "Definition Pages" do

  #before { visit definitions_path }
  subject { page }

  #it_behaves_like "all pages"

  xit "should have GET definitions_path" do
    # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
    get definitions_path
    response.status.should be(200)
  end

  describe "show all definitions" do

    it "should render all definitions alphabetically" do
    end
  end
end