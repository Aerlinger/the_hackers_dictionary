class Category < ActiveRecord::Base
  before_validation :convert_to_uppercase
  attr_accessible :name

  has_and_belongs_to_many :definitions

  validates :name, presence: true, uniqueness: {case_sensitive: false}

  def to_param
    "#{self.id}-#{self.name.downcase}"
  end

  private

  def convert_to_uppercase
    if self.name?
      self.name.strip!
      self.name.upcase!
    end
  end

end
