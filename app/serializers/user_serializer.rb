class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password_digest

  has_one :weather
  has_many :events
  has_many :todos
end
