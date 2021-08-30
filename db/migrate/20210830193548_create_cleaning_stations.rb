class CreateCleaningStations < ActiveRecord::Migration[6.0]
  def change
    create_table :cleaning_stations do |t|
      t.string :name
      t.string :address
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
