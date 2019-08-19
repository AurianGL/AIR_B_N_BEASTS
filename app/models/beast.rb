class Beast < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  validates :name, :description, :address, :dangerosity, :price, :type
  belongs_to :user
  #has_many :bookings
  #has_many :reviews, through: :bookings
  #has_many :users, through: :bookings
end
