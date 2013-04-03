class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.string :name
      t.text :description
      t.integer :size

      t.timestamps
    end
  end
end
