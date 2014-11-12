class AddMaxPeopleToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :max_people, :integer
  end
end
