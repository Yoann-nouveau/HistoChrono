class ChangeLocationToAddressInEvents < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :location
    add_column :events, :address, :string
  end
end
