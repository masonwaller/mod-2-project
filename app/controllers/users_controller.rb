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
        #store in lowercare to avoid duplcates
        @user.email.downcase!
        if @user.valid?
            @user.save
            flash[:notice] = "Account created successfully!"
            session[:user_id] = @user.id
            redirect_to @user
        else 
            flash.now.alert = "Oops, not successful! please ask your hooman to created an account for you and try again. "
            render '/welcome'
        end
    end

    private 
    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end
