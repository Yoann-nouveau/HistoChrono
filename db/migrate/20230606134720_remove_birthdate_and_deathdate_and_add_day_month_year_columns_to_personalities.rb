class RemoveBirthdateAndDeathdateAndAddDayMonthYearColumnsToPersonalities < ActiveRecord::Migration[7.0]
  def change
    remove_column :personalities, :birthdate, :datetime
    remove_column :personalities, :deathdate, :datetime
    add_column :personalities, :birth_day, :integer
    add_column :personalities, :birth_month, :integer
    add_column :personalities, :birth_year, :integer
    add_column :personalities, :death_day, :integer
    add_column :personalities, :death_month, :integer
    add_column :personalities, :death_year, :integer
  end
end
