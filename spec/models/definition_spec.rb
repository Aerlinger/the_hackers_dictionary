require "spec_helper"

describe Definition do

  before(:all) do
    @definition = FactoryGirl.create(:definition)
  end

  subject { @definition }

  it { should be_valid }
  it { should respond_to :word }
  it { should respond_to :definition_text }
  it { should respond_to :author }
  it { should respond_to :author_email }
  it { should respond_to :tags }

  its(:word) { should_not be_empty }
  its(:definition_text) { should_not be_empty }
  its(:tags) { should_not be_empty }
  its(:author) { should be_nil }
  its(:author_email) { should be_nil }
  its(:example) { should be_nil }
  its(:links) { should be_empty }

  it { should respond_to :categories }

  context "should not be valid" do
    specify "without word" do
      invalid_definition = Definition.new(definition_text: "test", tags: ["test_subject"])
      invalid_definition.should be_valid
    end

    specify "without definition text" do
      definition = Definition.new(word: "test", tags: ["subject"])
      definition.should_not be_valid
    end

    specify "without tags" do
      definition = Definition.new(word: "test", definition_text: "this is a definition")
      definition.should_not be_valid
    end
  end

  context "should be valid" do
    specify "with word, definition_text, and tags" do
      definition = Definition.new(word: "test", definition_text: "this is a definition", tags: ["subject"])
      definition.should be_valid
    end
  end

  describe "Creating a definition" do

    describe "with three unique categories should create three new categories" do
      specify do
        expect{ FactoryGirl.create(:definition) }.to change{Category.count}.by(3)
      end
    end

    describe "with one unique category should only create one new category" do
      specify do
        expect {
          Definition.create!(word: "test", definition_text: "This is a test definition", tags: ["unique_category"])
        }.to change{Category.count}.by(1)
      end
    end

  end

end