class AddPeopleNumberToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :people_number, :integer
  end
end
