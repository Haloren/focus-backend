class TodoSerializer < ActiveModel::Serializer
  attributes :id, :item
  belongs_to :user
end
