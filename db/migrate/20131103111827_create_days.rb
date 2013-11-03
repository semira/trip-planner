class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.string :city
      t.string :notes
      t.string :hotel

      t.timestamps
    end
  end
end
