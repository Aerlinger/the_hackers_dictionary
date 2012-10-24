class Definition < ActiveRecord::Base
  after_create :add_to_categories

  attr_accessible :author, :author_email, :word, :definition_text, :example, :tags, :word
  serialize :tags

  belongs_to :user
  has_and_belongs_to_many :categories, uniq: true

  validates_presence_of :word, :definition_text, :tags

  default_scope order(:word)
  #scope :highest_rated
  #scope :most_viewed
  scope :most_recent, lambda { |limit=10| order("created_at desc").limit(limit) }
  scope :starts_with, lambda { |letter| select { |definition| definition.word.first.downcase == letter.downcase } }

  private

  def add_to_categories
    tags.each do |tag|
      category = Category.find_or_create_by_name(tag)
      if category
        category.definitions << self
        category.save!
      end
    end
  end
end


