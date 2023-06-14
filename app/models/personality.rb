class Personality < ApplicationRecord
  belongs_to :period
  belongs_to :user

  has_many :approvals, as: :voteable

  has_one_attached :photo

  scope :to_approve, -> { where("progress < ?", 10) }
  scope :order_by_creation, -> { order("created_at DESC") }
  scope :not_approved_by, ->(user) { where.not(id: user.approvals.where(voteable_type: self.name).pluck(:voteable_id)) }

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
