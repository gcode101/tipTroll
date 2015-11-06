class ChangeColumn < ActiveRecord::Migration
  def change
  	change_column :cust_ratings, :score, :integer, :default => 0
  end
end
