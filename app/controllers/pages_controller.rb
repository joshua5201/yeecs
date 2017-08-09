class PagesController < ArticlesController
  def index
    @post_categories = PostCategory.includes(:posts).where(hidden: false).order(rank: :asc).first(3)
    @banners = Banner.includes(:post).order(rank: :asc)
    @link_blocks = LinkBlock.order(id: :asc)
  end
end
