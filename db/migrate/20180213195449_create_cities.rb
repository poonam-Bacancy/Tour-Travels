class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.string :city_name
      t.text :city_place
      t.timestamps
    end
  end
end
