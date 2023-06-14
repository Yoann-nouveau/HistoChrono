class UpdateEventsDefaultToZeroProgress < ActiveRecord::Migration[7.0]
  def change
    change_column_default :events, :progress, 0
  end
end
