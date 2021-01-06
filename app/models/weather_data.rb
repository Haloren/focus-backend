require 'net/http'

class WeatherData

    attr_reader :results

    # https://openweathermap.org/weather-data
    # WeatherData.new(85086)
    def initialize(location)

        url = "https://api.openweathermap.org/data/2.5/weather?zip=#{location},&appid=#{ENV['WEATHER_API_KEY']}"
        byebug
        uri = URI(url)
        response = Net::HTTP.get(uri)
        output = JSON.parse(response)
        # Check and provide a solution for if @output.empty?

        @kelvintemp = (output['main']['temp']).to_i 
        #(output['main']['temp_min'])
        #(output['main']['temp_max'])
            @tofahrenheit = (@kelvintemp-273.15)*9/5+32
            @tocelsius = (@kelvintemp-273.15)
        @description = (output['weather'][0]['description'])
        @city = (output['name'])
        
    end

end