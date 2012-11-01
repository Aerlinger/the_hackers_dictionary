class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:username]

  has_many :definitions
  before_create :make_admin_if_aerlinger

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me

  validates_presence_of :username, :password, :password_confirmation
  validates :email, email_format: {message: "Email invalid"}, if: :email_present?
  validates :username, format: {with: /^[A-Za-z|_]+\d*$/}, length: {minimum: 3, maximum: 15}, uniqueness: { case_sensitive: false }

  def total_votes
    # This is from RailsCasts Episode #364:
    # DefinitionVote.joins(:definition).where(definitions: {user_id: self.id}).sum('value')
    #
    # Modified for my own purposes as:
    DefinitionVote.joins(:definition).where(user_id: self.id).sum('value')
  end

  private

  def make_admin_if_aerlinger
    if username.downcase == 'aerlinger'
      self.admin = true
    end
  end

  def email_required?
    false
  end

  def email_present?
    email.present?
  end

end
