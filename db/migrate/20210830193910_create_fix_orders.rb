class CreateFixOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :fix_orders do |t|
      t.references :cleaning_station, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
