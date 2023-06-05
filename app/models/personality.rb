class Personality < ApplicationRecord
  belongs_to :period
  belongs_to :user

  valdiates :fullname, presence: true
  valdiates :birthdate, presence: true
  valdiates :deathdate, presence: true
  valdiates :description, presence: true
  valdiates :wikipedia_url, presence: true
end
