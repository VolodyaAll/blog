class ArticlesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]
  before_action :load_article, only: [:show, :edit, :update, :destroy]

  def new
  end

  def create
    @article = Article.new article_params
    if @article.save
      redirect_to @article
    else
      render action: 'new'
    end
  end

  def index
    @articles = Article.order(id: :desc)
  end

  def show
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render action: 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: "Delete success"
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

  def load_article
    @article ||= Article.find(params[:id])
  end
end
