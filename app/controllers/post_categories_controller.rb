class PostCategoriesController < ApplicationController
  def show
    @post_category = PostCategory.find(params[:id])
    @posts = @post_category.posts.order(created_at: :desc).page(params[:page]).per(10)
    render('posts/index')
  end
end
