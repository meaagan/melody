class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :instrument

  # Maybe add dates
  scope :with_instruments_for, -> (user) { where(instruments: {user: user}, status: [nil, true]) }
end
