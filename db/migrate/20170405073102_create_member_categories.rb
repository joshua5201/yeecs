class CreateMemberCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :member_categories do |t|
      t.string :title
      t.integer :rank, default: 0
      t.string :url

      t.timestamps
    end
  end
end
