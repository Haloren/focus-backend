class TodoSerializer < ActiveModel::Serializer
  attributes :id, :item, :user_id
  belongs_to :user
end
