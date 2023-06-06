class AddEndDayMonthYearToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :end_day, :integer
    add_column :events, :end_month, :integer
    add_column :events, :end_year, :integer
  end
end
