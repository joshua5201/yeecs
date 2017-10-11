class CreateLinkBlocks < ActiveRecord::Migration[5.0]
  def change
    create_table :link_blocks do |t|
      t.string :title
      t.string :image
      t.string :link

      t.timestamps
    end
  end
end
