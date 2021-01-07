class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :date, :user_id
  belongs_to :user
end
