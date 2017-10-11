class AddEnContentToArticlesAndMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :en_content, :text
    add_column :articles, :en_content, :text
  end
end
