class FixFinishFlightIdName < ActiveRecord::Migration[5.1]
  def change
      rename_column :flights, :finish_airport_id, :to_airport_id
  end
end
