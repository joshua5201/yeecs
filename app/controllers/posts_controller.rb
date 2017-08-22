class PostsController < ArticlesController
  def index
    @posts = Post.order(id: :desc).where(hidden: false).page(params[:page]).per(10)
  end
end
