class Professional < ActiveRecord::Base
	has_many :cust_ratings
	has_many :pro_ratings, dependent: :destroy

	def average_rating
  	pro_ratings.sum(:score) / pro_ratings.size
	end
end
