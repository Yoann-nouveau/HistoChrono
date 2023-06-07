class Monument < ApplicationRecord
  belongs_to :period
  belongs_to :user

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :name, presence: true
  validates :location, presence: true
  validates :description , presence: true
  validates :wikipedia_url , presence: true
end
