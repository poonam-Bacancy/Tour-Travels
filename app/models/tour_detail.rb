class TourDetail < ApplicationRecord
	belongs_to :driver
	belongs_to :bus
	belongs_to :package
end
