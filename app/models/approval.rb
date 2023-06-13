class Approval < ApplicationRecord
  belongs_to :user
  belongs_to :voteable, polymorphic: true

  validates :vote, presence: true
end
