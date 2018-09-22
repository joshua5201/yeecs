class AddCompanyEmail < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :company_email, :string
  end
end
