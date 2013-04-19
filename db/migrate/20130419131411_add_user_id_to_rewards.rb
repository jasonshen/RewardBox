class AddUserIdToRewards < ActiveRecord::Migration
  def change
  	add_column :rewards, :user_id, :integer
  	add_index :rewards, :user_id
  end
end
