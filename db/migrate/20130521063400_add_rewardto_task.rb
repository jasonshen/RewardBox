class AddRewardtoTask < ActiveRecord::Migration
  def change
  	add_column :tasks, :reward_id, :integer
  	add_column :tasks, :reward_description, :string
  end

end
