class WeathersController < ApplicationController
    before_action :set_user

    def show
        weather = Weather.find_by(id: params[:id])
        render json: weather
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
    def set_user
        @user = User.find(params[:user_id])
    end

    def weather_params
        params.require(:weather).permit(:zip, :user_id)
    end
end
