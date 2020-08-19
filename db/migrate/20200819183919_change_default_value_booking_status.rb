class ChangeDefaultValueBookingStatus < ActiveRecord::Migration[6.0]
  def change
    change_column_default :bookings, :status, nil
  end
end
