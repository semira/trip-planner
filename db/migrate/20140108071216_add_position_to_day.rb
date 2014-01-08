class AddPositionToDay < ActiveRecord::Migration
  def change
    add_column :days, :position, :integer
  end
end
