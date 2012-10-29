require 'spec_helper'

describe "Definition Pages" do

  subject { page }
  before { visit new_definition_path }

  it "should have GET definitions_path" do
    # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
    get definitions_path
    response.status.should be(200)
  end

  describe "after creating a definition" do

    it "should redirect to new definition path" do
      should have_content("Create a new definition")
      should have_css("input[name='commit']")
    end

    describe "fill in definition form data" do
      before do
        @definition = FactoryGirl.create(:definition)
        fill_in "definition_word", with: @definition.word
        fill_in "definition_definition_text", with: @definition.definition_text
        fill_in "definition_tags", with: @definition.tags.join(", ")
      end

      describe "should be valid with complete data" do
        before { click_button("Create Definition") }

        it "should not have any errors" do
          @definition.errors.should be_empty
        end


        it "make a new definition and redirect to the show definition page" do
          page.current_path.should eq definition_path(@definition.id+1)
        end

        it "should display the definition word" do
          page.should have_content(@definition.word)
        end

        it "should display the definition text" do
          page.should have_content(@definition.definition_text)
        end

        it "should display the category tags" do
          @definition.categories.each do |category|
            page.should have_content(category.name)
          end
        end

      end
    end
  end
end