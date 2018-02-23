class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.belongs_to :package, index: true
      t.string :book_name
      t.date :book_date
      t.string :tour_name
      t.float :book_ticket_num 
      t.float :book_price
      t.float :book_amount
      t.integer :status
      t.float :tax
      t.float :total_amount
      t.float :other
      t.integer :payment_status
      t.belongs_to :user , foreign_key:true

      t.timestamps
    end
  end
end
