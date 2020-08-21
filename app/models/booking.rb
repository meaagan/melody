class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :instrument

  scope :with_instruments_for, -> (user) { where(instruments: {user: user}, status: [nil, true]) }
end
