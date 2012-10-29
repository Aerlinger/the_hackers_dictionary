require 'spec_helper'

describe "Definition Pages" do

  subject { page }

  #it_behaves_like "all pages"

  it "should have GET definitions_path" do
    # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
    get definitions_path
    response.status.should be(200)
  end

  pending "show all definitions" do
    it "should render all definitions alphabetically" do
    end
  end
end