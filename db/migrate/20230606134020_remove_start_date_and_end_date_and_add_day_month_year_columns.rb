class RemoveStartDateAndEndDateAndAddDayMonthYearColumns < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :start_date, :datetime
    remove_column :events, :end_date, :datetime
    add_column :events, :start_day, :integer
    add_column :events, :start_month, :integer
    add_column :events, :start_year, :integer
  end
end
