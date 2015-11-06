class ProRating < ActiveRecord::Base
  belongs_to :customer
  belongs_to :professional
  validates :customer_id, uniqueness: { scope: :professional_id}
end
