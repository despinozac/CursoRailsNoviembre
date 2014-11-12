class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.date :reservation_date
      t.integer :from
      t.integer :to
      t.string :description

      t.timestamps
    end
  end
end
