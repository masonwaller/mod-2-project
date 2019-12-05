class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       redirect_to '/parks'
    end
    
  end

  def welcome
  end
  def page_requires_login
  end
  def destroy
    session[:user_id] = nil
    redirect_to '/welcome'
  end
end
