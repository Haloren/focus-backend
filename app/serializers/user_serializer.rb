class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email

  has_one :weather
  has_many :events
  has_many :todos
end
