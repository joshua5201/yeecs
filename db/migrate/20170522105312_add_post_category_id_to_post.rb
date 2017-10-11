class AddPostCategoryIdToPost < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :post_category_id, :integer
  end
end
