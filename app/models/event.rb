class Event < ApplicationRecord
  belongs_to :period
  belongs_to :user

  has_many :approvals, as: :voteable

  has_one_attached :photo

  scope :to_approve, -> { where("progress < ?", 10) }
  scope :order_by_creation, -> { order("created_at DESC") }
  scope :not_approved_by, ->(user) { where.not(id: user.approvals.where(voteable_type: self.name).pluck(:voteable_id)) }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true
  validates :start_year,
    presence: true,
    inclusion: { in: 1600..Date.today.year },
    format: {
      with: /(16|17|18|19|20)\d{2}/i,
      message: "should be a four-digit year"
    }
  validates :end_year,
    presence: true,
    inclusion: { in: 1600..Date.today.year },
    format: {
      with: /(16|17|18|19|20)\d{2}/i,
      message: "should be a four-digit year"
    }
  validates :address, presence: true
  validates :description, presence: true
  validates :wikipedia_url, presence: true
end
