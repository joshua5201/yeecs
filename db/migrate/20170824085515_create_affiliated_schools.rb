class CreateAffiliatedSchools < ActiveRecord::Migration[5.0]
  def change
    create_table :affiliated_schools do |t|
      t.string :title
      t.string :en_title
      t.string :url
      t.string :img

      t.timestamps
    end
  end
end
