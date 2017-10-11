class CreatePostCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :post_categories do |t|
      t.string :title
      t.string :en_title
      t.string :url
      t.integer :rank

      t.timestamps
    end
  end
end
