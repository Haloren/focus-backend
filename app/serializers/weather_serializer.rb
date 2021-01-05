class WeatherSerializer < ActiveModel::Serializer
  attributes :id, :zip
  belongs_to :user
end
