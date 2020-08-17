class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :instrument

  # Maybe add dates
end
