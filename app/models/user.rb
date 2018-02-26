class User < ApplicationRecord
  has_many :bookings
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_save { email.downcase! }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   validates :name, presence: true,length: { maximum: 50 }
   validates :gender, presence: true
   validates :state, presence: true,length: { maximum: 80 }
   validates :city, presence: true
   validates :uname, presence: true,length: { maximum: 10 }

   after_create :assign_default_role_to_user

   def assign_default_role_to_user
    if self.has_role? ""
     add_role(:visitor)
   end
     end
end
