class UsersController < ApplicationController
  def show
  end

  def new
  end

  def create
    user = user_params
    user[:name] = user[:name].downcase
    new_user = User.create(user)
    if new_user.save
      flash[:success] = "Welcome #{new_user.name.capitalize}"
      redirect_to root_path
    else
      redirect_to new_user_path
      flash[:alert] = "Name, Email, and password must be valid"
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end