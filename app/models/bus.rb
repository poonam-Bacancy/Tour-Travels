class Bus < ApplicationRecord
	mount_uploader :bus_image, ImageUploader
	has_many :tour_details
end
