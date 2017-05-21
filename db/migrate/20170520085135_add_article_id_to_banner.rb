class AddArticleIdToBanner < ActiveRecord::Migration[5.0]
  def change
    add_column :banners, :article_id, :integer
  end
end
