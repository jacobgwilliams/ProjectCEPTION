class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user || User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user != nil
  end

  def require_login
    redirect_to '/sessions/new' unless logged_in?
  end

  def is_admin?
    current_user.admin
  end
end
