class Event < ApplicationRecord
  belongs_to :period
  belongs_to :user

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :location, presence: true
  validates :description, presence: true
  validates :wikipedia_url, presence: true

end
