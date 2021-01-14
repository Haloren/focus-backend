class Weather < ApplicationRecord
  belongs_to :user

  validates :zip, presence: true, length: { is: 5 }

  def self.get_data_from_weather_data(zipcode = "89412")
    resp = WeatherData.new(zipcode) 
    weather_data = resp.results
  end

  # def self.create_from_weather_data(weather_data)
  #   create(
  #     city: weather_data['name'],
  #     description: weather_data['weather'][0]['description'],
  #     kelvintemp: weather_data['main']['temp'].to_i
  #   )

  # # @kelvintemp = (@results['main']['temp']).to_i 
  # # #(@results['main']['temp_min']).to_i
  # # #(@results['main']['temp_max']).to_i
  # #     @tofahrenheit = (@kelvintemp-273.15)*9/5+32
  # #     @tocelsius = (@kelvintemp-273.15)
  # # @description = (@results['weather'][0]['description'])
  # # @city = (@results['name'])
  # end
end
