class Customer < ActiveRecord::Base

def formatted_price
    price_in_dollars = (price_in_cents.to_f / 100) *100
    format("$%.2f", price_in_dollars)
end
end
