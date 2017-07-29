class PostCategoriesController < ApplicationController
  def show
    @post_category = get_resouce_by_url_or_id(Article)
    @posts = @post_category.posts.order(created_at: :desc).page(params[:page]).per(10)
    render('posts/index')
  end
end
