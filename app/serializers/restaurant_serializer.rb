class RestaurantSerializer < ActiveModel::Serializer
  has_many :reviews
  has_many :reservations
  has_many :photos
  attributes :id, :name, :address, :credit_card, :delivery, :phone, :longitude, :latitude, :restaurant_photo, :info, :description, :reservations, :photos, :reviews
end
