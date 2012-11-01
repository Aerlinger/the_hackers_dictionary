class RemoveIndexFromCategoriesAndDefinitions < ActiveRecord::Migration
  def change
    remove_index :definitions, name: "definitions_index"
  end
end
