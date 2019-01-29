class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :restaurant_id
      t.integer :user_id
      t.datetime :time
      t.string :message
      t.datetime :date
      t.integer :party_size

      t.timestamps
    end
  end
end
