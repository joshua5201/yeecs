class AddEducationBackgroundToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :education_background, :string
  end
end
