class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :beast
  belongs_to :user, through: :beast
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true
end
