class AddReferencesToDefinitions < ActiveRecord::Migration
  def change
    add_column :definitions, :references, :text, default: ""
  end
end
