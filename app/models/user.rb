class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, :phone_number, presence: true
  has_many :beasts
  has_many :bookings
  # has_many :reviews, through: :bookings
end
