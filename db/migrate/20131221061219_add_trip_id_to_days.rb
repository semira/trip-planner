class AddTripIdToDays < ActiveRecord::Migration
  def change
    add_column :days, :trip_id, :integer
  end
end
