class TodoSerializer < ActiveModel::Serializer
  attributes :id, :item
  has_one :user
end
