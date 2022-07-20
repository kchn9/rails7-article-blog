class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category was succesfully created"
      redirect_to @category
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  # def destroy
  # end

  # def edit
  # end

  private
  def category_params
    params.require(:category).permit(:name)
  end

end
