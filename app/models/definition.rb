class Definition < ActiveRecord::Base
  after_save :add_to_categories
  before_save :set_first_character, :clean_tags

  attr_protected :starts_with
  attr_accessible :author, :author_email, :word, :definition_text, :example, :tags, :word
  serialize :tags

  belongs_to :user
  has_and_belongs_to_many :categories

  validates_presence_of :word, :definition_text, :tags

  default_scope order("word DESC")

  scope :most_recent, lambda { |limit=10| order("created_at desc").limit(limit) }
  scope :starts_with, lambda { |letter| where(first_character: letter.downcase) }


  private

  def set_first_character
    self.first_character = word.first.downcase
  end

  def clean_tags
    if tags.is_a? String
      self.tags = tags.split(/,|;/)
    end

    tags.map do |tag|
      tag.strip!
      tag.upcase!
    end
  end

  def add_to_categories
    tags.each do |tag|
      category = Category.find_or_create_by_name(tag.upcase)
      category.definitions << [self]
    end
  end
end


