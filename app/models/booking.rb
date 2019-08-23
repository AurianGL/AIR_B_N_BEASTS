class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :beast
  has_many :reviews, dependent: :destroy
  # belongs_to :user, through: :beast
  validates :start_date, presence: true
  validates :end_date, presence: true
end
