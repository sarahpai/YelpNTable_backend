class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :time, :message, :date, :party_size, :restaurant_id
  
end
