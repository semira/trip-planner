class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :tripname
      t.datetime :startdate

      t.timestamps
    end
  end
end
