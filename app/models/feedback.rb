class Feedback < ApplicationRecord
	#before_save { email.downcase! }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :feedback_email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }

	
	validates_format_of :feedback_mno,length: { is: 6 }, :with =>  /\d[0-9]\)*\z/ ,
	 :message => "Only positive number without spaces are allowed" ,
	 numericality: { only_integer: true }

	validates :feedback_comment, presence: true
end
