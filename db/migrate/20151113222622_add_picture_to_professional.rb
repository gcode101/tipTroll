class AddPictureToProfessional < ActiveRecord::Migration
  def change
    add_column :professionals, :picture, :string
  end
end
