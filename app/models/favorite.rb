class Favorite < ActiveRecord::Base
  belongs_to :customer
  # , counter_cache: true
  has_many :professionals, :through => :professionals



end
