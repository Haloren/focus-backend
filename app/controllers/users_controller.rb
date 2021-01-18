class UsersController < ApplicationController
    
    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find_by(id: params[:id])
            if user
                weather = Weather.find_by(user_id: user.id)
                zipcode = weather.zip
            else
                zipcode = 86337
            end
        weatherdata = WeatherData.new(zipcode)
        render json: weatherdata
        # @tofahrenheit = (@kelvintemp-273.15)*9/5+32
        # @tocelsius = (@kelvintemp-273.15)
    end

    def create
        user = User.new(user_params)
        # byebug
        if user.save
            render json: user
        else
            render json: {message: user.errors.full_messages.to_sentence}
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password_digest)
    end

end
