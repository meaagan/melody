class AddColumnDescriptionInstruments < ActiveRecord::Migration[6.0]
  def change
    add_column :instruments, :description, :text
  end
end
