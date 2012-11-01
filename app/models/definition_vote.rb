class DefinitionVote < ActiveRecord::Base
  attr_accessible :definition_id, :definition, :value

  belongs_to :definition
  belongs_to :user

  validates_uniqueness_of :definition_id, scope: :user_id
  validates_inclusion_of :value, in: [1, -1]
  validate :ensure_not_author

  def ensure_not_author
    errors.add :user_id, "is the author of the definition" if self.definition.user_id == user_id
  end

end
