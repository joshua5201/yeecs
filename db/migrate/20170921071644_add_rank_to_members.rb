class AddRankToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :rank, :integer, default: 0
  end
end
