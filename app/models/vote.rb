class Vote < ApplicationRecord
  belongs_to :user

  validates :vote, presence: true
end
