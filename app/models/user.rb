class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :monuments, dependent: :nullify
  has_many :events, dependent: :nullify
  has_many :personalities, dependent: :nullify
  has_many :approvals, dependent: :destroy

end
