class Beast < ApplicationRecord
  SPECIES = ["Owl", "Elf", "Basilisk", "Hungarian Horntail", "Fawke", "Dementor", "Goblin", "Troll", "Cerberus"]
  mount_uploader :photo, PhotoUploader
  validates :name, :description, :address, :dangerosity, :price, :species, presence: true
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many :users, through: :bookings

  include PgSearch::Model
  pg_search_scope :search,
                  against: [:name, :species, :price, :dangerosity],
                  using: {
                    tsearch: { prefix: true }
                  }
end
