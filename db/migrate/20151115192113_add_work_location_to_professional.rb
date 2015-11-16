class AddWorkLocationToProfessional < ActiveRecord::Migration
  def change
    add_column :professionals, :current_employer, :string
  end
end
