class CreatePeriods < ActiveRecord::Migration[7.0]
  def change
    create_table :periods do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.json :polygons

      t.timestamps
    end
  end
end
