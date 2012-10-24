class Categorization < ActiveRecord::Base
  attr_accessible :category_id, :definition_id

  belongs_to :category
  belongs_to :definition
end
