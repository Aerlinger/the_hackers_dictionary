require 'spec_helper'

describe Category do

  before(:each) do
    @category = FactoryGirl.create(:category)
  end

  subject { @category }

  its(:name) { should_not be_blank }
  it { should respond_to :name }
  it { should respond_to :definitions }
  its(:definitions) { should be_empty }

  describe "is not valid" do
    it "without a name" do
      invalid_category = Category.new()
      invalid_category.should_not be_valid
    end

    it "with an already used name" do
      invalid_category = FactoryGirl.create(:category, name: "unique_name")
      invalid_category.should be_valid

      invalid_category = FactoryGirl.build(:category, name: "unique_name")
      invalid_category.should_not be_valid
    end

    it "converts category name to uppercase" do
      category = FactoryGirl.create(:category, name: "category_lowercase")
      category.name.should eq "CATEGORY_LOWERCASE"
    end

  end

end
