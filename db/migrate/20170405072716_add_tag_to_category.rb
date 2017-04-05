class AddTagToCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :tag, :string
  end
end
