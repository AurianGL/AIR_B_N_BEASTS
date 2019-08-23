class Beast < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  SPECIES = ["Owl", "Elf", "Basilisk", "Hungarian Horntail", "Fawke", "Dementor", "Goblin", "Troll", "Cerberus"]
  DANGEROSITIES = (1..5)
  PRICES = (15..150)

  has_many :bookings

  has_many :reviews, through: :bookings, dependent: :destroy

  has_many :users, through: :bookings

  belongs_to :user


  include PgSearch::Model
  pg_search_scope :search,
                  against: [:name, :species, :price, :dangerosity],
                  using: {
                    tsearch: { prefix: true }
                  }

  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :dangerosity, presence: true
  validates :price, presence: true
  validates :species, presence: true
end
