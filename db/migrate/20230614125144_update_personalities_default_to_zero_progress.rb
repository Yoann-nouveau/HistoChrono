class UpdatePersonalitiesDefaultToZeroProgress < ActiveRecord::Migration[7.0]
  def change
    change_column_default :personalities, :progress, 0
  end
end
