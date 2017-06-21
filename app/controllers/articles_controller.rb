class ArticlesController < ApplicationController
  def show
    @posts = Post.order(id: :asc).first(5)
    if params[:id].to_i == 0 
      @article = Article.find_by!(url: params[:id])
    else
      @article = Article.find_by!(id: params[:id])
    end
  end
end
