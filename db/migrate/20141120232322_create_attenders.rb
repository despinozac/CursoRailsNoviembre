class CreateAttenders < ActiveRecord::Migration
  def change
    create_table :attenders, id: false do |t|
      t.integer :user_id
      t.integer :reservation_id
      t.string :type

      t.timestamps
    end
    add_index :attenders, [:user_id, :reservation_id] 
  end
end
