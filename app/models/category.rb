class Category < ActiveRecord::Base
  before_validation :convert_to_uppercase
  attr_accessible :name

  has_and_belongs_to_many :definitions

  validates :name, presence: true, uniqueness: {case_sensitive: false}

  private

  def convert_to_uppercase
    self.name = name.upcase
  end

end
