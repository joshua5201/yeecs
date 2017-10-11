class PostsController < ArticlesController
  def index
    @posts = Post.order(id: :desc).not_hidden.page(params[:page]).per(10)
  end
end
