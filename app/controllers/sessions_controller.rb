class SessionsController < ApplicationController
  def landing
    
  end

  def new

  end

  def create

  end

  def login_form

  end

  def login
    
  end

  def omniauth
    user = User.from_omniauth(request.env["omniauth.auth"])
    if User.valid?
      session[:user_id] = user.id
      redirect to user_path(user)
    else
      redirect_to root_path
    end
  end
end