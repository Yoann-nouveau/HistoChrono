class Monument < ApplicationRecord
  belongs_to :period
  belongs_to :user

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_address?

  valdiates :name, presence: true
  valdiates :location, presence: true
  valdiates :description , presence: true
  valdiates :wikipedia_url , presence: true
end
