class AddCodeSnippetToDefinitions < ActiveRecord::Migration
  def change
    add_column :definitions, :is_snippet, :boolean, default: false
  end
end
