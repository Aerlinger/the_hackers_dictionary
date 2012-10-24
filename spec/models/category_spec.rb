require 'spec_helper'

describe Category do

  before(:all) do
    @category = FactoryGirl.create(:category)
  end

  subject { @category }

  its(:name) { should_not be_blank }
  it { should respond_to :name }
  it { should respond_to :definitions }
  its(:definitions) { should be_empty }

  it "be invalid without a name" do
    invalid_category = Category.new()
    invalid_category.should_not be_valid
  end

end
