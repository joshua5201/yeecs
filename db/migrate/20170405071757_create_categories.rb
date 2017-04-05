class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :title
      t.string :main_url
      t.integer :rank, default: 0

      t.timestamps
    end
  end
end
