class ChangeProgessToBeIntegerInMonuments < ActiveRecord::Migration[7.0]
  def change
    change_column :monuments, :progess, :integer
  end
end
