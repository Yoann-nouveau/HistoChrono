class ChangeProgessToBeIntegerInEvents < ActiveRecord::Migration[7.0]
  def change
    change_column :events, :progess, :integer
  end
end
