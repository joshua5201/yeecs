class PagesController < ArticlesController
  def index
    @post_categories = PostCategory.includes(:posts).not_hidden.order(rank: :asc).first(3)
    @banners = Banner.includes(:post).order(rank: :asc)
    @link_blocks = LinkBlock.order(id: :asc)
  end

  def show
    super
    if I18.locale != 'zh-TW'.to_sym && @article.en_hidden && @article.category.main_url.present?
      return redirect_to @article.category.main_url
    end
  end
end
