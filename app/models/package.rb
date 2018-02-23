class Package < ApplicationRecord
	has_many :tour_details
	has_many :booking
end
