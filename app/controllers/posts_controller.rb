class PostsController < ArticlesController
  def index
    @posts = Post.order(id: :desc)
  end
end
