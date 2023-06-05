class Monument < ApplicationRecord
  belongs_to :period
  belongs_to :user

  valdiates :name, presence: true
  valdiates :location, presence: true
  valdiates :description , presence: true
  valdiates :wikipedia_url , presence: true
end
