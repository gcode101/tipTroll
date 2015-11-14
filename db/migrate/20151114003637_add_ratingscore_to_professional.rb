class AddRatingscoreToProfessional < ActiveRecord::Migration
  def change
    add_column :professionals, :rating_score, :integer
  end
end
