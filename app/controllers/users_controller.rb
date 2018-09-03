class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
     @user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params.require(:user).permit(:username, :email, :dob, :address, :phone, :password, :password_confirmation))
  	if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: 'User was successfully created'      
    else
      flash[:notice] = "Form is invalid"
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id]) 
    if @user.update(params.require(:user).permit(:username, :email, :dob, :address, :phone, :password, :password_confirmation))
      redirect_to @user
    else
      render 'edit'
    end
  end

  def login
    unless current_user
      redirect_to  new_article_path, notice: 'You must be logged in to access this section'  # halts request cycle
    end
  end

end
