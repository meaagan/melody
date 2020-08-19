class AddAddressToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :address, :string
  end
end
