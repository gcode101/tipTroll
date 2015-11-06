class Professional < ActiveRecord::Base

  has_secure_password

  # EMAIL_REGEX = /\A[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+\z/
  # validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  # validates :email, :presence => true, :uniqueness => true, format: { with: EMAIL_REGEX }
  # validates :password, :confirmation => true #password_confirmation attr
  # validates_length_of :password, :in => 6..20, :on => :create


	has_many :cust_ratings
	has_many :pro_ratings, dependent: :destroy

	def average_rating
  	pro_ratings.sum(:score) / pro_ratings.size
	end

end
