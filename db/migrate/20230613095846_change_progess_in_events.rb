class ChangeProgessInEvents < ActiveRecord::Migration[7.0]
  def change
    change_column :events, :progress, :integer
  end
end
