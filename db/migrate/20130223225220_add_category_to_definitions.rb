class AddCategoryToDefinitions < ActiveRecord::Migration
  def change
    add_column :definitions, :category, :string
    remove_column :definitions, :tags
  end
end
