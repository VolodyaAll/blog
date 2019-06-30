class CommentsController < ApplicationController

  before_action :authenticate_user!, only: [:create]
  before_action :load_article, only: [:create]
    
  def create    
    @article.comments.create(comment_params)
    
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(author: current_user.username)
  end

  def load_article
    @article ||= Article.find(params[:article_id])
  end
end
