class Personality < ApplicationRecord
  belongs_to :period
  belongs_to :user

  has_many :approvals, as: :voteable

  has_one_attached :photo

  validates :fullname, presence: true
  validates :description, presence: true
  validates :wikipedia_url, presence: true

  validates :birth_year,
    presence: true,
    inclusion: { in: 1600..Date.today.year }

  validates :death_year, inclusion: { in: 1600..Date.today.year }, allow_blank: true

  def name
    fullname
  end
end
