class AddHiddenToPageAndPostCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :hidden, :boolean, default: false
    add_column :post_categories, :hidden, :boolean, default: false
  end
end
