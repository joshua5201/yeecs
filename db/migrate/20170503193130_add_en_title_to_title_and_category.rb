class AddEnTitleToTitleAndCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :en_title, :string
    add_column :articles, :en_title, :string
  end
end
