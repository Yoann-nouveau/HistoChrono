class RenameProgessToProgress < ActiveRecord::Migration[7.0]
  def change
    rename_column :events, :progess, :progress
    rename_column :monuments, :progess, :progress
    rename_column :personalities, :progess, :progress
  end
end
