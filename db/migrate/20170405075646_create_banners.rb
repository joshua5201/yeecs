class CreateBanners < ActiveRecord::Migration[5.0]
  def change
    create_table :banners do |t|
      t.references :article, foreign_key: true
      t.integer :rank, default: 0

      t.timestamps
    end
  end
end
