class Instrument < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user

  CATEGORY = %w(Piano Violin Guitar Drums Flute Other)

  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORY }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :location, :description, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
