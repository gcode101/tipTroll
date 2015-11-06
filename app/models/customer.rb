class Customer < ActiveRecord::Base

	has_many :cust_ratings, dependent: :destroy
	has_many :pro_ratings

	def formatted_price
    price_in_dollars = (price_in_cents.to_f / 100) *100
    format("$%.2f", price_in_dollars)
	end

	def average_rating
  	cust_ratings.sum(:score) / cust_ratings.size
	end

end
