class Booking < ApplicationRecord
	belongs_to :package
	has_many :bills
	belongs_to :user
	enum status:["pending","confirmed"]
	enum payment_status:["paid","cancel"]
end
