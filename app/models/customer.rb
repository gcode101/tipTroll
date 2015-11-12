class Customer < ActiveRecord::Base

  has_secure_password

  # EMAIL_REGEX = /\A[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+\z/
  # validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  # validates :email, :presence => true, :uniqueness => true, format: { with: EMAIL_REGEX }
  # validates :password, :confirmation => true #password_confirmation attr
  # validates_length_of :password, :in => 6..20, :on => :create


	has_many :cust_ratings, dependent: :destroy
	has_many :pro_ratings
  has_many :professionals, :through => :professionals
  has_many :favorites, dependent: :destroy

	def formatted_price
    price_in_dollars = (price_in_cents.to_f / 100) *100
    format("$%.2f", price_in_dollars)
	end

	def average_rating
  	cust_ratings.sum(:score) / cust_ratings.size
	end


end
