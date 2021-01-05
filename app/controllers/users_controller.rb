class UsersController < ApplicationController
    
    def index
        users = User.all
        render json: users, include: [:weather, :todos, :events]
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: user
        else
            render json: {message: user.errors.full_messages.to_sentence}
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :email)
    end

end
