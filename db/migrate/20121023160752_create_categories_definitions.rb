class CreateCategoriesDefinitions < ActiveRecord::Migration
  def change
    create_table :categories_definitions, :id => false do |t|
      t.references :category, null: false
      t.references :definition, null: false
    end

    add_index(:categories_definitions, [:category_id, :definition_id], unique: true)
  end
end
