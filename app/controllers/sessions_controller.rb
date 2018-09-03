class SessionsController < ApplicationController

  def new

  end
  def home
  	
  end

  def create
    @user = User.find_by_username(params[:username])   
    if @user && @user.authenticate(params[:password]) 
      session[:user_id] = @user.id
      render 'users/show', notice: 'Logged in!'
    else
      flash[:notice] = "Invalid Username or Password"
      render 'new' 
    end
  end

  def destroy
    session[:user_id] = nil   
    redirect_to root_url, notice: 'Logged out!'
  end
end
