class UsersController < ApplicationController

def new
  @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.email.downcase!
    if @user.save
    	log_in @user
      flash[:success] = "OK"
      redirect_to '/'
    else
      flash.now.alert = "Couldn't create account. Please make sure you are using a valid email and valid password"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
  	@user = User.all
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
	end


