class CreateMemberDepartments < ActiveRecord::Migration[5.0]
  def change
    create_table :member_departments do |t|
      t.string :title
      t.string :en_title

      t.timestamps
    end
  end
end
