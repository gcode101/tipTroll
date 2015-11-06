class Customer < ActiveRecord::Base
	has_many :cust_ratings, dependent: :destroy
	has_many :pro_ratings

	def average_rating
  	cust_ratings.sum(:score) / cust_ratings.size
	end
end
