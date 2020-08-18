class ChangeColumnStatusDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default :bookings, :status, false
  end
end
