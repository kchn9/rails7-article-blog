class UsersController < ApplicationController

  def index
    redirect_to :signup
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User was created successfully. Welcome #{@user.username}!"
      redirect_to('articles#index', status: :see_other)
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
