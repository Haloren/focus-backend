class WeatherData

    attr_reader :results

    # https://openweathermap.org/weather-data
    def initialize(location)
        user_zip = '85086'

        @url = "https://api.openweathermap.org/data/2.5/weather?zip=#{user_zip},&appid=#{ENV['WEATHER_API_KEY']}" # move to a model or make into a helper
        # byebug
        @uri = URI(@url)
        @response = Net::HTTP.get(@uri)
        @output = JSON.parse(@response)
        # Check and provide a solution for if @output.empty?

        @kelvintemp = (@output['main']['temp']).to_i 
        @tofahrenheit = (@kelvintemp-273.15)*9/5+32
        @tocelsius = (@kelvintemp-273.15)
    end

end