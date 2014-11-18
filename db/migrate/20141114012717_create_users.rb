class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :id_card
      t.string :mail
      t.decimal :grades_av

      t.timestamps
    end
  end
end
