class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :date
  belongs_to :user
end
