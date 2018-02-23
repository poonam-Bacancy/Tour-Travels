class BookMailer < ApplicationMailer
	default :from => "poonam.shah@bacancytechnology.com"
	  def booking_status(user,booking)
	  	@booking = booking
	  	@user=user
	  	mail(:to =>@booking.user.email,:subject => "Booking confirmed")
	  end
end
