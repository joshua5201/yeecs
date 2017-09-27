class AddEnColumnsToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :en_name, :string
    add_column :members, :en_title, :string
    add_column :members, :en_full_title, :string
  end
end
