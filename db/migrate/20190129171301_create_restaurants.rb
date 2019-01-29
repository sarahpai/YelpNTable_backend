class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.boolean :credit_card
      t.boolean :delivery
      t.string :phone
      t.float :longitude
      t.float :latitude
      t.string :restaurant_photo
      t.string :info
      t.string :description

      t.timestamps
    end
  end
end
