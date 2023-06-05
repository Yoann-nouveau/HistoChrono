class CreatePersonalities < ActiveRecord::Migration[7.0]
  def change
    create_table :personalities do |t|
      t.string :fullname
      t.datetime :birthdate
      t.datetime :deathdate
      t.text :description
      t.string :wikipedia_url
      t.references :period, null: false, foreign_key: true
      t.float :progess
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
