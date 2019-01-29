class UserSerializer < ActiveModel::Serializer
  has_many :reviews 
  has_many :reservations
  attributes :user_name, :profile_picture, :email, :first_name, :last_name, :id, :location, :phone, :reviews, :reservations
end