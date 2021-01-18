class Weather < ApplicationRecord
  belongs_to :user

  validates :zip, presence: true, length: { is: 5 }

  # def self.get_data_from_weather_data(zipcode = "86337")
  #   resp = WeatherData.new(zipcode) 
  #   weather_data = resp.results
  # end
  
end
