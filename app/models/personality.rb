class Personality < ApplicationRecord
  belongs_to :period
  belongs_to :user

  validates :fullname, presence: true
  validates :birth_year, presence: true
  validates :death_year, presence: true
  validates :description, presence: true
  validates :wikipedia_url, presence: true

  validates :birth_year,
  presence: true,
  inclusion: { in: 1600..Date.today.year },
  format: {
    with: /(16|17|18|19|20)\d{2}/i,
    message: "should be a four-digit year"
  }
  validates :death_year,
  presence: true,
  inclusion: { in: 1600..Date.today.year },
  format: {
  with: /(16|17|18|19|20)\d{2}/i,
  message: "should be a four-digit year"
}

end
