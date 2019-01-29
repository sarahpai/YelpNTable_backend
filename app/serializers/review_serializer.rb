class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :comment, :star
end
