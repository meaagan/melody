class Instrument < ApplicationRecord
  include AlgoliaSearch
  
  has_many :bookings, dependent: :destroy
  has_many :meetings, dependent: :destroy
  belongs_to :user

  algoliasearch do
    attributes :name, :description, :category, :location
  end

  CATEGORY = %w(Keyboard Violin Guitar Drums Flute Harmonica)

  validates :user_id, presence: true
  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORY }
  validates :price, presence: true, numericality: { only_integer: true }
  validates :location, :description, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
