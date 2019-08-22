class Review < ApplicationRecord
  belongs_to :booking
  validate :rating, presence: true
  validate :content, presence: true
end
