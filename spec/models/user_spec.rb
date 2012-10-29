describe User do

  before do
    User.delete_all
    @user = FactoryGirl.create(:user)
  end
  subject { @user }

  it { should be_valid }
  its(:email) { should be_blank }
  its(:password) do
    should_not be_blank
    should eq @user.password_confirmation
  end

  it { @user.definitions.should be_empty }

  describe "should not be valid" do

    specify "without password" do
      @user.password = ""
      @user.should_not be_valid
    end

    specify "with too short of a password" do
      @user.password = "asdfj"
      @user.password_confirmation = "asdfj"
      @user.should_not be_valid
    end

    specify "without password confirmation" do
      @user.password_confirmation = ""
      lambda {@user.save!}.should raise_error(ActiveRecord::RecordInvalid)
    end

    specify "without non-matching password confirmation" do
      @user.password_confirmation = "invalid_confirmation"
      lambda {@user.save!}.should raise_error(ActiveRecord::RecordInvalid)
    end

    specify "without username" do
      @user.username = ""
      @user.should_not be_valid
    end

    specify "with too short of a name" do
      @user.username = "Bo"
      @user.should_not be_valid
    end

    specify "with too long of a name" do
      @user.username = "B" * 16
      @user.should_not be_valid
    end

    specify "with a name containing invalid characters" do
      @user.username = "@b*o"
      @user.should_not be_valid
    end

    specify "with a name containing punctuation marks" do
      @user.username = "John!"
      @user.should_not be_valid
      @user.username = "John?"
      @user.should_not be_valid
      @user.username = "John,"
      @user.should_not be_valid
    end

    specify "with a name containing spaces" do
      @user.username = "John Smith"
      @user.should_not be_valid
    end
  end

  describe "should be valid" do

    specify "without an email address" do
      @user.email = ""
      @user.should be_valid
    end

    specify "with a username containing numbers and underscores" do
      @user.username = "John_Smith87"
      @user.should be_valid
    end

  end

end