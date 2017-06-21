class PagesController < ArticlesController
  def index
    @post_categories = PostCategory.includes(:posts).order(id: :asc).first(3)
  end
end
