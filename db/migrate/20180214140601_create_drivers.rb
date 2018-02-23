class CreateDrivers < ActiveRecord::Migration[5.1]
  def change
    create_table :drivers do |t|
      t.string :driver_name
      t.text :driver_address
      t.string :driver_city
      t.string :driver_mno

      t.timestamps
    end
  end
end
