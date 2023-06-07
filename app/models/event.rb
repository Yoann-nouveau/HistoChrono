class Event < ApplicationRecord
  belongs_to :period
  belongs_to :user


  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true
  validates :start_year,
    presence: true,
    inclusion: { in: 1600..Date.today.year },
    format: {
      with: /(16|17|18|19|20)\d{2}/i,
      message: "should be a four-digit year"
    }
  validates :end_year,
    presence: true,
    inclusion: { in: 1600..Date.today.year },
    format: {
      with: /(16|17|18|19|20)\d{2}/i,
      message: "should be a four-digit year"
    }
  validates :address, presence: true
  validates :description, presence: true
  validates :wikipedia_url, presence: true
end
