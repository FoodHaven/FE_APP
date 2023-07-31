class SessionsController < ApplicationController

  def landing
  end

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      log_in(user)
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
    log_out
    redirect_to root_path
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end