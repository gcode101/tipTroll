class Favorite < ActiveRecord::Base
  belongs_to :customer
  has_many :professionals, :through => :professionals



end
