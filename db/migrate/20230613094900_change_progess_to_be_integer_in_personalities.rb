class ChangeProgessToBeIntegerInPersonalities < ActiveRecord::Migration[7.0]
  def change
    change_column :personalities, :progess, :integer
  end
end
