class ArticlesController < ApplicationController

  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_authorized_user, only: [:edit, :update, :destroy]

  def index
    @articles = Article.all()
  end

  def show
  end

  def create
    @article = Article.new(receive_article_params)
    @article.user = current_user
    if @article.save && @article.user
      flash[:success] = "Article was created successfully."
      redirect_to(@article)
    else
      render :new
    end
  end

  def new
    @article = Article.new()
  end

  def edit
  end

  def update
    if @article.update(receive_article_params)
      flash[:success] = "Article was edited successfully."
      redirect_to(@article)
    else
      render :edit
    end
  end

  def destroy
    @article.destroy()
    flash[:success] = "Article was deleted successfully."
    redirect_to articles_path, status: :see_other
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def receive_article_params
    params.require(:article).permit(:title, :content)
  end

  def require_authorized_user
    if current_user != @article.user && !current_user.admin?
      flash[:warning] = "You are not allowed to perform that action"
      redirect_to @article
    end
  end
end
