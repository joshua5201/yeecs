class PostsController < ArticlesController
  def index
    @posts = Post.order(id: :desc).page(params[:page]).per(10)
  end
end
