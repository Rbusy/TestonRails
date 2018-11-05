class WelcomeController < ApplicationController
  def index
    if cookies[:user_name] == nil
      render 'login'
    end
  end

  def login
    @user = User.new
  end
end
