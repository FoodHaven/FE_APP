class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def landing
  end

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name.capitalize}"
      redirect_to root_path
    else
      flash[:error] = "Sorry, your credentials are bad"
      redirect_to "/login"
    end
  end

  def omniauth
    user = User.from_omniauth(request.env["omniauth.auth"])
    if user.valid?
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end