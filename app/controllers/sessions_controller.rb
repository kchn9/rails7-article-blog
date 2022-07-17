class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:login].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to articles_path
    else
      flash.now[:danger] = "There was something wrong with your login details."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out successfully."
    redirect_to articles_path, status: :see_other
  end

end
