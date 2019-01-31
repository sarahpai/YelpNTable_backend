class DropColumnFromReservations < ActiveRecord::Migration[5.2]
  def change
    remove_column :reservations, :date
    remove_column :reservations, :reservation_date
  end
end
