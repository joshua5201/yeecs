class PostCategoriesController < ApplicationController
  def show
    @post_category = PostCategory.find(params[:id])
    @posts = @post_category.posts.order(created_at: :desc)
    render('posts/index')
  end
end
