class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :username, :content, :rating, :movie_id

  belongs_to :movie
end
