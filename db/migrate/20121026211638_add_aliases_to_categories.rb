class AddAliasesToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :aliases, :text
  end
end
