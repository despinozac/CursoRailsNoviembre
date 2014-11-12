class AddRoomRefToReservations < ActiveRecord::Migration
  def change
    add_reference :reservations, :room, index: true
  end
end
