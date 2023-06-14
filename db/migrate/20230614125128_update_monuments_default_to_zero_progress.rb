class UpdateMonumentsDefaultToZeroProgress < ActiveRecord::Migration[7.0]
  def change
    change_column_default :monuments, :progress, 0
  end
end
