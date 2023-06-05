class CreateMonuments < ActiveRecord::Migration[7.0]
  def change
    create_table :monuments do |t|
      t.string :name
      t.string :location
      t.text :description
      t.string :wikipedia_url
      t.string :google_earth_url
      t.float :progess
      t.float :latitude
      t.float :longitude
      t.references :period, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
