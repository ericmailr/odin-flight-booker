class FixStartFlightIdName < ActiveRecord::Migration[5.1]
  def change
      rename_column :flights, :start_airport_id, :from_airport_id
  end
end
