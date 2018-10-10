class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.integer :start_airport_id
      t.integer :finish_airport_id
      t.datetime :departure_time
      t.integer :duration

      t.timestamps
    end
  end
end
