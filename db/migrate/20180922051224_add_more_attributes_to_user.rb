class AddMoreAttributesToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :mobile, :string
    add_column :users, :telephone, :string
    add_column :users, :zipcode, :string
    add_column :users, :address, :string
    add_column :users, :job, :string
    add_column :users, :company_phone, :string
    add_column :users, :master, :string
    add_column :users, :master_instructor, :string
    add_column :users, :phd, :string
    add_column :users, :phd_instructor, :string
    add_column :users, :current_location, :string
    add_column :users, :note, :string
  end
end
