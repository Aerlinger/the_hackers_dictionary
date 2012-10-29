class AddUserIdToDefintions < ActiveRecord::Migration
  def change
    add_column :definitions, :user_id, :integer
  end
end
