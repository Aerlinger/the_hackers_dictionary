class AddFirstCharacterToDefinitions < ActiveRecord::Migration
  def change
    add_column :definitions, :first_character, :string
    add_index :definitions, [:word, :first_character, :author, :tags], unique: true, name: "definitions_index"
  end
end
