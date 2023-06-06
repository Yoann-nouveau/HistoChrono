class Event < ApplicationRecord
  belongs_to :period
  belongs_to :user

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_address?

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :wikipedia_url, presence: true
end
