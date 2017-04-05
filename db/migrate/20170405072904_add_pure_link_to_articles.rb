class AddPureLinkToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :is_pure_link, :boolean, :default => false
  end
end
