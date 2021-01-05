class UsersController < ApplicationController
    
    def index
        users = User.all
        render json: users
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: user
        else
            render json: {message: "Email and/or Password are incorrect"}
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :email)
    end

end
