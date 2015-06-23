require "spec_helper"

describe "Definitions" do

  before do
    Definition.delete_all

    @definition = FactoryGirl.create(:definition, word: "aardvark")
    @c = FactoryGirl.create(:definition, word: "c")
    @cpp = FactoryGirl.create(:definition, word: "c++")
    @unix = FactoryGirl.create(:definition, word: "unix")
    @rspec = FactoryGirl.create(:definition, word: "RSpec")
    @capybara = FactoryGirl.create(:definition, word: "Capybara")
  end

  subject { @definition }

  it "should be the right size" do
    Definition.count.should be 6
  end

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
  it { should respond_to :user }

  it "should have uppercase tags" do
    tag_term = @definition.tags.first
    tag_term.should eq tag_term.upcase
  end

  pending "returning all definitions should be sorted alphabetically" do

    it "when returning all definitions" do
       Definition.all.should eq [@definition, @c, @capybara, @cpp, @rspec, @unix]
    end

    it "when returning by a single letter" do
      c_words = Definition.starts_with('c')
      c_words.should be [@c, @capybara, @cpp]
    end
  end

  context "should not be valid" do
    specify "without word" do
      invalid_definition = Definition.new(definition_text: "test", tags: ["test_subject"])
      invalid_definition.should_not be_valid
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

    specify "with a unique category should create three new categories" do
      expect {
        Definition.create!(word: "test", definition_text: "This is a test definition", tags: ["one", "two", "three"])
      }.to change { Category.count }.by(3)
    end

    specify "with one unique category should only create one new category" do
      expect {
        Definition.create!(word: "test", definition_text: "This is a test definition", tags: ["unique_category"])
      }.to change { Category.count }.by(1)
    end

    specify "without unique category should not create a new category" do
      expect {
        Definition.create(word: "test1", definition_text: "This is a test definition", tags: ["non-unique"])
        Definition.create(word: "test2", definition_text: "This is a test definition", tags: ["non-unique"])
      }.to change { Category.count }.by(1)
    end

    it "should create multiple tags from a comma delimited string" do
      d = Definition.create(word: "test4", definition_text: "This is a test definition", tags: "one,  two, three, four")

      d.tags.should == ["ONE", "TWO", "THREE", "FOUR"]
    end

    it "should create multiple tags from a semicolon delimited string" do
      d = Definition.create(word: "test4", definition_text: "This is a definition", tags: "one;  two; three; four")
      d.tags.should eq ["ONE", "TWO", "THREE", "FOUR"]
    end

    it "should capitalize tags" do
      d = Definition.create(word: "test4", definition_text: "This is a definition", tags: ["one"])
      d.tags.should eq ["ONE"]
    end

  end

end