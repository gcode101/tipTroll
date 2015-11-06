class ChangeProColumn < ActiveRecord::Migration
  def change
  	change_column :pro_ratings, :score, :integer, :default => 0
  end
end
