class UsersController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
    def show
        @user = User.find(params[:id])
    end
    def new 
        @user = User.new
    end
    def create 
        @user = User.new(user_params)
        # byebug
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to @user
        else 
            render '/welcome'
        end
    end

    private 
    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end
