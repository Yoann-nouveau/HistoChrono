class Period < ApplicationRecord
  has_many :monuments
  has_many :events
  has_many :personalities

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
