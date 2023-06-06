class Event < ApplicationRecord
  belongs_to :period
  belongs_to :user

  validates :name, presence: true
  validates :start_year, presence: true
  validates :end_year, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :wikipedia_url, presence: true

end
