class AddRankToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :rank, :integer, default: 0
  end
end
