class PostCategoriesController < ApplicationController
  def show
    @post_category = PostCategory.find(params[:id])
    @posts = @post_category.posts.page(params[:page]).per(10)
    render('posts/index')
  end
end
