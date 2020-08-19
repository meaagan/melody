class Instrument < ApplicationRecord
  has_many :bookings
  has_many :users

  validates :name, presence: true, uniqueness: true
  validates :category, presence: true, inclusion: { in: %w(Piano Violin Guitar Drums Flute Other) }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :location, :description, presence: true
end
