class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.datetime :start_time
      t.integer :duration
      t.integer :from_airport_id, index:true
      t.integer :to_airport_id, index:true

      t.timestamps
    end
  end
end
