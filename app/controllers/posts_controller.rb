class PostsController < ArticlesController
  def index
    @posts = Post.order(id: :asc)
  end
end
