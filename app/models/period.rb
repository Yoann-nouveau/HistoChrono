class Period < ApplicationRecord
  has_many :monuments, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :personalities, dependent: :destroy

  has_one_attached :photo

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
