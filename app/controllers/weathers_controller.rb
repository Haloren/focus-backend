class WeathersController < ApplicationController

    def show
        weather = Weather.find_by(id: params[:id])
        render json: weather
    end

    def create
        weather = Weather.new(weather_params)
        if weather.save
            render json: weather
        else
            render json: {message: user.errors.full_messages.to_sentence}
        end
    end

    def destroy
        weather = Weather.all.find_by(id: parmas[:id])
        user = User.find(weather.user_id)
        if weather
            weather.destroy
            render json: user
        else 
            render json: {message: "Delete failed"}
        end
    end

    private
    def weather_params
        params.require(:weather).permit(:zip, :user_id)
    end
end
