class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:warning] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end

  def require_authorized_user
    if current_user != @article.user && !current_user.admin?
      flash[:warning] = "You are not allowed to edit this article."
      redirect_to @article
    end
  end

end
