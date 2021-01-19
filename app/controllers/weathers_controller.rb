class WeathersController < ApplicationController
    before_action :set_user

    def show
        # weather = Weather.find_by(id: params[:id])
        # render json: weather

        def show
            user = User.find_by(id: params[:id])
                if user
                    user_weather = Weather.find_by(user_id: user.id)
                    zipcode = user_weather.zip
                else
                    zipcode = 86337
                end
            weather = WeatherData.new(zipcode)
            render json: weather
            # @tofahrenheit = (@kelvintemp-273.15)*9/5+32
            # @tocelsius = (@kelvintemp-273.15)
        end
    end

    def create
        # weather = Weather.new(weather_params)
        weather = @user.weathers.new(weather_params)
        if weather.save
            # render json: weather
            render json: @user
        else
            render json: {message: weather.errors.full_messages.to_sentence}
        end
    end

    def update
        # byebug
        weather = Weather.find_by(id: params[:id])
        user = User.find(weather.user_id)
        if weather
            weather.update(zip: params["weather"]["zip"])
            render json:user
        else
            render json: {message: "Change zip code failed"}
        end
    end

    def destroy
        weather = Weather.all.find_by(id: params[:id])
        user = User.find(weather.user_id)
        if weather
            weather.destroy
            render json: user
        else 
            render json: {message: "Delete failed"}
        end
    end

    private
    def set_user
        @user = User.find(params[:user_id])
    end

    def weather_params
        params.require(:weather).permit(:zip, :user_id)
    end
end
