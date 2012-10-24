require 'spec_helper'

describe "Categories" do

  before { visit definitions_path }
  subject { page }

  it "should have GET categories_path" do
    # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
    get categories_path
    response.status.should be(200)
  end

end
