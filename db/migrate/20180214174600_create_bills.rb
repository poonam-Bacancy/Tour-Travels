class CreateBills < ActiveRecord::Migration[5.1]
  def change
    create_table :bills do |t|
      t.belongs_to :booking, index: true
      t.string :bill_name
      t.string :tour_name
      t.float :bill_amount
      t.float :tax
      t.float :other
      t.float :bill_total
      t.string :payment

      t.timestamps
    end
  end
end
