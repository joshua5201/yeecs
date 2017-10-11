class ChangeLabProgramUrlToFile < ActiveRecord::Migration[5.0]
  def change
    rename_column :lab_programs, :url, :file
  end
end
