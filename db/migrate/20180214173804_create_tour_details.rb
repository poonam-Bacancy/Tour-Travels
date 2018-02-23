class CreateTourDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :tour_details do |t|
      t.belongs_to :bus, index: true
      t.belongs_to :driver, index: true
      t.belongs_to :package, index: true
      t.date :from_date
      t.date :to_date

      t.timestamps
    end
  end
end
