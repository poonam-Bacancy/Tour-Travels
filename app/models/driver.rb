class Driver < ApplicationRecord
	has_many :tour_details
	#validates :driver_name ,presence:true,format: { with: /\A[a-zA-Z]+\z/,
    #message: "only allows letters" }
    validates :driver_city,presence:true,format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
	validates :driver_address, presence: true
	validates :driver_mno, presence: true, length: { is: 10 },numericality: { only_integer: true }
end
