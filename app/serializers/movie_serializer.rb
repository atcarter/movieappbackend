class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :year, :synopsis

  has_many :reviews
end
