class ChangeColumnInReservations < ActiveRecord::Migration[5.2]
  def change
    change_column(:reservations, :date, :string)
  end
end
