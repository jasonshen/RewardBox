class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :tasks, [:user_id, :created_at]
  end
end
