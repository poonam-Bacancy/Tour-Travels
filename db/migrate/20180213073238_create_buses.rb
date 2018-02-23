class CreateBuses < ActiveRecord::Migration[5.1]
  def change
    create_table :buses do |t|
      t.string :bus_no
      t.integer :bus_total_seat
      t.string :bus_type
      t.string :bus_image

      t.timestamps
    end
  end
end
