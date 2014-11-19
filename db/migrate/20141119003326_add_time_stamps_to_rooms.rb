class AddTimeStampsToRooms < ActiveRecord::Migration
  def change
    change_table :rooms do |t|
      t.timestamps
    end
  end
end
