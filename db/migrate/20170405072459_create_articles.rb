class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :subtitle
      t.text :content
      t.string :url
      t.string :image
      t.string :type
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
