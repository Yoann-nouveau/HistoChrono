class Monument < ApplicationRecord
  belongs_to :period
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true
  validates :address, presence: true
  validates :description , presence: true
  validates :wikipedia_url , presence: true
end
