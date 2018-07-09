class AddUserAttributes < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :student_no, :string
    add_column :users, :company_name, :string
  end
end
