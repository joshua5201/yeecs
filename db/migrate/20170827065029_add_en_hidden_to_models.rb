class AddEnHiddenToModels < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :en_hidden, :boolean, default: false
    add_column :categories, :en_hidden, :boolean, default: false
    add_column :post_categories, :en_hidden, :boolean, default: false
  end
end
