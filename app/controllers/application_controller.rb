class ApplicationController < ActionController::Base
  helper_method :current_user, :user_signed_in?, :log_out

  def current_user
    @_current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def user_signed_in?
    current_user.present?
  end

  def authenticate_user!
    unless user_signed_in?
    end
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @_current_user = nil
  end
  def address_format
    params[:address] = "#{params[:street]}, #{params[:city]}, #{params[:state]} #{params[:zipcode]}"
  end
end
