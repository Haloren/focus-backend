require 'net/http'

class WeatherData

    attr_reader :results

    # https://openweathermap.org/weather-data
    def initialize(zipcode)
        url = "https://api.openweathermap.org/data/2.5/weather?zip=#{zipcode},&appid=#{ENV['WEATHER_API_KEY']}"
        # byebug
        uri = URI(url)
        response = Net::HTTP.get(uri)
        @results = JSON.parse(response)
        # Check and provide a solution for if @output.empty?
    end

end