class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:show, :edit, :update, :destroy]
  before_action :require_authorized_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all()
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Account information was edited successfully."
      redirect_to @user
    else
      render :edit
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "User was created successfully. Welcome #{@user.username}!"
      redirect_to articles_path
    else
      render :new
    end
  end

  def destroy
    @user.articles.each do |a|
      a.destroy()
    end
    @user.destroy
    session[:user_id] = nil
    flash[:notice] = "User deleted successfully."
    redirect_to articles_path, status: :see_other
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def require_authorized_user
    if current_user != @user
      flash[:alert] = "You are not allowed to edit this user."
      redirect_to users_path
    end
  end
end
