class AddRankToSchools < ActiveRecord::Migration[5.0]
  def change
    add_column :affiliated_schools, :rank, :integer, :default => 0
  end
end
