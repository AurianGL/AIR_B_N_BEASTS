class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :beast
  belongs_to :user, through: beast
  validates :start_date, :end_date, :status, presence: true
end
