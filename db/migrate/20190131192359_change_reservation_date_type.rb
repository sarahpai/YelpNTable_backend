class ChangeReservationDateType < ActiveRecord::Migration[5.2]
  def change
    add_column(:reservations, :reservation_date, :date)
  end
end
