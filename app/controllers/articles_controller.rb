class ArticlesController < ApplicationController
  
  def new
  end

  def create
    @article = Article.new article_params
    if @article.valid?
      @article.save
      redirect_to @article
    else
      render action: 'new'
    end
  end

  def index
    @articles = Article.order(id: :desc)
  end

  def show
    @article = Article.find params[:id]
  end

  def edit
    @article = Article.find params[:id]
  end

  def update
    @article = Article.find(params[:id])
    permitted_columns = params.require(:article).permit(:title, :description)
    @article.update_attributes(permitted_columns)
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end

end
