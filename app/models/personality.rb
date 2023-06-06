class Personality < ApplicationRecord
  belongs_to :period
  belongs_to :user

  validates :fullname, presence: true
  validates :birthdate, presence: true
  validates :deathdate, presence: true
  validates :description, presence: true
  validates :wikipedia_url, presence: true
end
