class Review < ApplicationRecord
  # belongs_to :user
  belongs_to :booking
  # belongs_to :user, through: :beast
  validates :content, presence: true
  validates :stars, inclusion: { in: [1, 2, 3, 4, 5] }
end
