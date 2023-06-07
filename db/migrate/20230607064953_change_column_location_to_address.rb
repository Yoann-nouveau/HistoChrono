class ChangeColumnLocationToAddress < ActiveRecord::Migration[7.0]
  def change
    remove_column :monuments, :location
    remove_column :events, :location
    add_column :monuments, :address, :string
    add_column :events, :address, :string
  end
end
