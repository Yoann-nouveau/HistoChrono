class Personality < ApplicationRecord
  belongs_to :period
  belongs_to :user

  validates :fullname, presence: true
  validates :birth_year, presence: true
  validates :death_year, presence: true
  validates :description, presence: true
  validates :wikipedia_url, presence: true
end
