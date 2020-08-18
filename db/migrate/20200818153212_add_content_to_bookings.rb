class AddContentToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :content, :text
  end
end
