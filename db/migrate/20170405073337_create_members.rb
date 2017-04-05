class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :name
      t.string :title
      t.string :full_title
      t.text :content
      t.string :image
      t.string :link
      t.references :member_category, foreign_key: true

      t.timestamps
    end
  end
end
