class AddEnTitleToMemberCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :member_categories, :en_title, :string
  end
end
