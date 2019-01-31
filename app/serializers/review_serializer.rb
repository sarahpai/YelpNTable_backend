class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :comment, :star, :user_id, :restaurant_id
end
