class UpdateTableForCategoriesDefinitions < ActiveRecord::Migration
  def change
    drop_table :categories_definitions

    create_table :categories_definitions, :id => false do |t|
      t.references :category, :definition
    end

    add_index :categories_definitions, [:category_id, :definition_id]
  end
end
