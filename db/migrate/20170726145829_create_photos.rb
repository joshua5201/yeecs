class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :file
      t.string :alt

      t.timestamps
    end
  end
end
