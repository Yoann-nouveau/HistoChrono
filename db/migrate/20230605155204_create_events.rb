class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :location
      t.text :description
      t.string :wikipedia_url
      t.string :youtube_url
      t.float :progess
      t.references :period, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
