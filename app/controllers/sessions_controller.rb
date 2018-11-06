class SessionsController < ApplicationController

before_action :current_user, only: [:edit, :update]

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = "Your are Logged in"
      redirect_to '/'
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :user_id)
    @user.update(user_params)
    flash[:success] = "Informations saved"
    redirect_to @user
end


  def destroy
  	log_out if logged_in?
    flash[:success] = "Logged out"
    redirect_to '/'
  end
end