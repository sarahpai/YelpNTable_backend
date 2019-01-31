class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :time, :message, :party_size, :restaurant_id, :user_id
  
end
