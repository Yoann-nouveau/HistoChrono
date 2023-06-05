class Vote < ApplicationRecord
  belongs_to :user

  vaildaites :vote, presence: true
end
