class Payment < ActiveRecord::Base
  belongs_to :customer
  belongs_to :professional
end
