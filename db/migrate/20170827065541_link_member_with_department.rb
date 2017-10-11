class LinkMemberWithDepartment < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :member_department_id, :integer
  end
end
