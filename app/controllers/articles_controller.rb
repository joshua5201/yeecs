class ArticlesController < ApplicationController
  def show
    @posts = Post.order(id: :desc).first(5)
    @article = get_resource_by_url_or_id(Article)
  end
end
