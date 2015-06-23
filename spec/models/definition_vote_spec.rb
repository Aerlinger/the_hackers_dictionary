require 'spec_helper'

describe DefinitionVote do

  it { should respond_to :user }
  it { should respond_to :definition }

  let(:standard_user) { FactoryGirld.create(:user) }
  let(:definition) { FactoryGirld.create(:definition) }

  describe "when trying to validate a user" do
    before do
      @upvote = FactoryGirl.build(:definition_vote)
    end

    subject(@upvote)

    describe "should show error" do
      it "when trying to save without a user or definition" do
        expect { @upvote.save }.to raise_error(NoMethodError)
      end

      it "without a definition" do
        @upvote.user = FactoryGirl.create(:user)
        @upvote.definition = nil
        expect { @upvote.save }.to raise_error(NoMethodError)
      end

    end

    describe "should be invalid" do
      before do
        @upvote.user = FactoryGirl.create(:user)
        @upvote.definition = FactoryGirl.create(:definition)
        @upvote.save
      end

      specify "without a vote value of -1 or 1" do
        [-10, -9, -7, -2, 0, 2, 4, 5].each do |vote_value|
          @upvote.value = vote_value
          @upvote.should_not be_valid
        end
      end
    end


  end
end
